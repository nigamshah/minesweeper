/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 10:43 PM
 * To change this template use File | Settings | File Templates.
 */
package view {
	import assets.Cell_mc;

	import flash.display.Sprite;

	public class CellView extends Sprite {
		public static const CELL_SIZE:Number = 32;

		//------------------------------------------
		// Object Pool
		private static var _objectPool:Vector.<CellView> = new Vector.<CellView>();

		public static function create():CellView {
			var result:CellView;

			if (_objectPool.length > 0) {
				result = _objectPool.pop();
			} else {
				result = new CellView(new Lock());
			}
			result.reset();
			return result;
		}
		public static function releaseToPool(cellModel:CellView):void {
			if (_objectPool.indexOf(cellModel) != -1) {
				_objectPool.push(cellModel);
			}
		}
		//------------------------------------------

		private var _mc:Cell_mc;

		public function CellView(lock:Lock) {
			_mc = new Cell_mc();
			graphics.beginFill(0x990000);
			graphics.drawRect(0, -32, 32, 32);
			addChild(_mc);
		}

		public function reset():void {
			_mc.flag.visible = false;
			_mc.cellHidden.visible = true;
			_mc.mine.visible = false;
			_mc.numAdjacentMinesText.visible = true;
			_mc.numAdjacentMinesText.text = "";
			_mc.cellBackingExploded.visible = false;
		}
	}
}

class Lock {}
