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
		private var _gameView:GameView;

		public function get menuView():MenuView {
			return _menuView;
		}
		public function get gameView():GameView {
			return _gameView;
		}

		public function init():void {
			_menuView = new MenuView();
			_gameView = new GameView();

			_menuView.visible = false;
			_gameView.visible = false;

			addChild(_menuView);
			addChild(_gameView);
		}

	}
}
