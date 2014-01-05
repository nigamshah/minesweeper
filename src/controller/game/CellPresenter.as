/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 5:21 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game {

	import flash.events.MouseEvent;

	import model.CellModel;

	import view.CellView;

	public class CellPresenter {

		//------------------------------------------
		// Object Pool
		private static var _objectPool:Vector.<CellPresenter> = new Vector.<CellPresenter>();
		public static function create(cellModel:CellModel):CellPresenter {
			var result:CellPresenter;

			if (_objectPool.length > 0) {
				result = _objectPool.pop();
			} else {
				result = new CellPresenter(new Lock());
				result._cellModel = cellModel;
			}
			result.reset();
			return result;
		}
		public static function releaseToPool(obj:CellPresenter):void {
			if (_objectPool.indexOf(obj) != -1) {
				_objectPool.push(obj);
			}
		}
		//------------------------------------------

		private var _cellView:CellView;
		private var _cellModel:CellModel;

		public function get cellView():CellView {
			return _cellView;
		}

		public function get cellModel():CellModel {
			return _cellModel;
		}

		public function CellPresenter(lock:Lock) {
			_cellView = new CellView();
			_cellView.addEventListener(MouseEvent.CLICK, onCellClick);

		}

		public function reset():void {
			_cellView.reset();
		}
		private function onCellClick(evt:MouseEvent):void {
			trace("clicked on cell = " + _cellModel.columnIndex, + _cellModel.rowIndex);

		}
	}
}
class Lock {}
