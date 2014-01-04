/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 7:39 PM
 * To change this template use File | Settings | File Templates.
 */
package view {
	import flash.display.Sprite;

	public class MainView extends Sprite {

		private var _menuView:MenuView;
		private var _hudView:HUDView;
		private var _boardView:BoardView;


		public function get menuView():MenuView {
			return _menuView;
		}

		public function get hudView():HUDView {
			return _hudView;
		}

		public function get boardView():BoardView {
			return _boardView;
		}

		public function init():void {
			_menuView = new MenuView();
			_hudView = new HUDView();
			_boardView = new BoardView();

			_menuView.visible = false;
			_hudView.visible = false;
			_boardView.visible = false;

			addChild(_menuView);
			addChild(_hudView);
			addChild(_boardView);
		}

	}
}
