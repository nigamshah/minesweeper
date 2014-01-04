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

		private var _mc:Cell_mc;

		public function CellView() {
			_mc = new Cell_mc();
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