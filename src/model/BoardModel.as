/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 9:35 PM
 * To change this template use File | Settings | File Templates.
 */
package model {
	import flashx.textLayout.factory.TruncationOptions;

	import utils.EnumerableUtils;
	import utils.IDisposable;
	import utils.ServiceLocator;

	public class BoardModel implements IDisposable {

		private var _numColumns:int;
		private var _numRows:int;
		private var _numMines:int;
		private var _numFlags:int;
		private var _cells:Vector.<Vector.<CellModel>>;

		public function get numColumns():int {
			return _numColumns;
		}

		public function set numColumns(value:int):void {
			_numColumns = value;
		}

		public function get numRows():int {
			return _numRows;
		}

		public function set numRows(value:int):void {
			_numRows = value;
		}

		public function get numMines():int {
			return _numMines;
		}

		public function set numMines(value:int):void {
			_numMines = value;
		}

		public function get numFlags():int {
			return _numFlags;
		}

		public function set numFlags(value:int):void {
			_numFlags = value;
		}

		public function get cells():Vector.<Vector.<CellModel>> {
			return _cells;
		}

		public function set cells(value:Vector.<Vector.<CellModel>>):void {
			_cells = value;
		}

		public function BoardModel() {

		}

		public function generateMines(cellModel:CellModel):void {
			trace("boardModel.generateMines");

			// determine eligible cells, put them in a 1D array
			var eligibleCells:Array = new Array();
			var safeRange:int = int(ServiceLocator.instance.mainModel.currentGameModel.gameConfig.forceCascadeFirstMove);

			var col:int;
			var row:int;

			for (col = 0; col < _numColumns; col++) {
				if (col < cellModel.columnIndex - safeRange || col > cellModel.columnIndex + safeRange) {
					for (row = 0; row < _numRows; row++) {
						if (row < cellModel.rowIndex - safeRange || row > cellModel.rowIndex + safeRange) {
							eligibleCells.push(_cells[col][row]);
						}
					}
				}
			}

			// shuffle array
			eligibleCells = EnumerableUtils.ArrayShuffle(eligibleCells);

			// set mines
			_numMines = ServiceLocator.instance.mainModel.currentGameModel.gameConfig.numMines;
			for (var i:int = 0; i < _numMines; i++) {
				CellModel(eligibleCells[i]).occupied = true;
			}

			// set numAdjacentMines
			for (col = 0; col < _numColumns; col++) {
				for (row = 0; row < _numRows; row++) {
					var cell:CellModel = _cells[col][row];
					cell.numAdjacentMines = 0;

					// scan the adjacent cells
					for (var adjCol:int = col - 1; adjCol <= col + 1; adjCol++) {

						if (adjCol < 0 || adjCol >= _numColumns) continue;

						for (var adjRow:int = row - 1; adjRow <= row + 1; adjRow++) {
							if (adjRow < 0 || adjRow >= _numRows || (adjCol == col && adjRow == row)) continue;
							if (_cells[adjCol][adjRow].occupied) {
								cell.numAdjacentMines++;
							}
						}
					}

				}
			}


		}

		public function dispose():void {
			for each (var col:Vector.<CellModel> in _cells) {
				for each (var cell:CellModel in col) {
					CellModel.releaseToPool(cell);
				}
			}
			_cells = null;
		}

	}
}
