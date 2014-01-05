/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 9:42 PM
 * To change this template use File | Settings | File Templates.
 */
package model {
	public class CellModel {

		//------------------------------------------
		// Object Pool
		private static var _objectPool:Vector.<CellModel> = new Vector.<CellModel>();
		public static function create():CellModel {
			var result:CellModel;

			if (_objectPool.length > 0) {
				result = _objectPool.pop();
			} else {
				result = new CellModel(new Lock());
			}
			result.reset();
			return result;
		}
		public static function releaseToPool(cellModel:CellModel):void {
			if (_objectPool.indexOf(cellModel) != -1) {
				_objectPool.push(cellModel);
			}
		}
		//------------------------------------------

		private var _columnIndex:int;
		private var _rowIndex:int;
		private var _occupied:Boolean;
		private var _numAdjacentMines:int;
		private var _revealed:Boolean;


		// properties
		public function get columnIndex():int {
			return _columnIndex;
		}

		public function set columnIndex(value:int):void {
			_columnIndex = value;
		}

		public function get rowIndex():int {
			return _rowIndex;
		}

		public function set rowIndex(value:int):void {
			_rowIndex = value;
		}

		public function get occupied():Boolean {
			return _occupied;
		}

		public function set occupied(value:Boolean):void {
			_occupied = value;
		}

		public function get numAdjacentMines():int {
			return _numAdjacentMines;
		}

		public function set numAdjacentMines(value:int):void {
			_numAdjacentMines = value;
		}
		public function get revealed():Boolean {
			return _revealed;
		}

		public function set revealed(value:Boolean):void {
			_revealed = value;
		}


		public function CellModel(lock:Lock) {}

		public function reset():void {
			_columnIndex = -1;
			_rowIndex = -1;

			_occupied = false;
			_numAdjacentMines = 0;
		}
	}
}
class Lock {}