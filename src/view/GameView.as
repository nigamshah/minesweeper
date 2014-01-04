/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 4:02 PM
 * To change this template use File | Settings | File Templates.
 */
package view {
	import flash.display.Sprite;

	public class GameView extends Sprite {

		private var _hudView:HUDView;
		private var _boardView:BoardView;

		public function get hudView():HUDView {
			return _hudView;
		}

		public function get boardView():BoardView {
			return _boardView;
		}

		public function GameView() {
			_hudView = new HUDView();
			_boardView = new BoardView();

			addChild(_hudView);
			addChild(_boardView);
		}
		public function reset():void {
			_hudView.reset();
			_boardView.reset();
		}

	}
}
