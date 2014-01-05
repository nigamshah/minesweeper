/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 8:11 PM
 * To change this template use File | Settings | File Templates.
 */
package view {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.Dictionary;

	import model.BoardModel;

	import controller.game.BoardPresenter;

	import utils.ServiceLocator;

	public class BoardView extends Sprite {

		public function BoardView() {
		}

		public function addCell(cellView:CellView, col:int, row:int):void {
			cellView.x = col * CellView.CELL_SIZE;
			cellView.y = row * -1 * CellView.CELL_SIZE;
			addChild(cellView);
		}

		public function clear():void {
			while(numChildren) removeChildAt(0);
		}
		public function resetPosition():void {
			x = (stage.stageWidth - width)/2;
			y = stage.stageHeight - ((stage.stageHeight - 100) - height)/2;
		}

		public function dispose():void {
			clear();
		}
	}
}
