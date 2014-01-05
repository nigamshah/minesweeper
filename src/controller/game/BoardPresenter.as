/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 5:21 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game {
	import controller.game.cell.CellPresenter;
	import controller.main.MainStateMachine;

	import model.BoardModel;

	import utils.ServiceLocator;

	import view.BoardView;

	public class BoardPresenter {

		private var _boardView:BoardView;
		private var _boardModel:BoardModel;

		private var _cells:Vector.<Vector.<CellPresenter>>;

		public function get boardView():BoardView {
			return _boardView;
		}

		public function BoardPresenter() {
			_boardView = new BoardView();
		}

		public function reset():void {
			dispose();
			_boardView.clear();
			_cells = new Vector.<Vector.<CellPresenter>>();

			_boardModel = ServiceLocator.instance.mainModel.currentGameModel.boardModel;

			for (var col:int = 0; col < _boardModel.numColumns; col++) {
				_cells[col] = new Vector.<CellPresenter>();
				for (var row:int = 0; row < _boardModel.numRows; row++) {
					var cellPresenter:CellPresenter = CellPresenter.create(_boardModel.cells[col][row]);
					_boardView.addCell(cellPresenter.cellView, col, row);
					_cells[col][row] = cellPresenter;
				}
			}
			_boardView.resetPosition();
		}

		public function toggleFlag(cell:CellPresenter):void {
			cell.toggleFlag();
		}
		public function clearCell(cell:CellPresenter):void {
			if (_boardModel.numMines == 0) {
				generateMines(cell);
				ServiceLocator.instance.mainStateMachine.handleTrigger(MainStateMachine.TRIGGER_MINES_GENERATED);
			}

			// do the cascade
			// use a queue instead of open them right away
			// allows for use of a cascade animation or some other visual aid
			var queue:Vector.<CellPresenter> = new Vector.<CellPresenter>();

			var queueCell:Function = function(cell:CellPresenter):void {
				if (!cell.cellModel.revealed && !cell.cellModel.occupied) {
					if (queue.indexOf(cell) == -1) {
						queue.push(cell);
						if (cell.cellModel.numAdjacentMines == 0) {
							var neighbors:Vector.<CellPresenter> = getAllNeighbors(cell);
							for each(var neighbor:CellPresenter in neighbors) {
								queueCell(neighbor);
							}
						}
					}
				}
			};

			queueCell(cell);
			cell.clearCell();
			_boardModel.clearCell();

			for (var i:int = 1; i < queue.length; i++) {
				queue[i].revealCell();
				_boardModel.clearCell();
			}
		}

		private function getAllNeighbors(cell:CellPresenter):Vector.<CellPresenter> {
			var result:Vector.<CellPresenter> = new Vector.<CellPresenter>();

			var col:int = cell.cellModel.columnIndex;
			var row:int = cell.cellModel.rowIndex;

			for (var adjCol:int = col - 1; adjCol <= col + 1; adjCol++) {
				if (adjCol < 0 || adjCol >= _boardModel.numColumns) continue;
				for (var adjRow:int = row - 1; adjRow <= row + 1; adjRow++) {
					if (adjRow < 0 || adjRow >= _boardModel.numRows || (adjCol == col && adjRow == row)) continue;
					result.push(_cells[adjCol][adjRow]);
				}
			}
			return result;
		}


		private function generateMines(cellPresenter:CellPresenter):void {
			_boardModel.generateMines(cellPresenter.cellModel);

			for each (var column:Vector.<CellPresenter> in _cells) {
				for each (var cell:CellPresenter in column) {
					cell.cellView.setMine(cell.cellModel.occupied);
					cell.cellView.setNumAdjacentMines(cell.cellModel.numAdjacentMines);
				}
			}
		}

		public function revealAllMines():void {
			for each (var column:Vector.<CellPresenter> in _cells) {
				for each (var cell:CellPresenter in column) {
					if (cell.cellModel.occupied) {
						cell.revealCell();
					}
				}
			}
		}



		public function dispose():void {
			for each (var col:Vector.<CellPresenter> in _cells) {
				for each (var cell:CellPresenter in col) {
					CellPresenter.releaseToPool(cell);
				}
			}
			_cells = null;
		}
	}
}
