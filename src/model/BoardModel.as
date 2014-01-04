/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 9:35 PM
 * To change this template use File | Settings | File Templates.
 */
package model {
	import utils.IDisposable;

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
