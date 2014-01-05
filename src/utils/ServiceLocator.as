/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 7:32 PM
 * To change this template use File | Settings | File Templates.
 */
package utils {
	import controller.input.InputController;

	import flash.display.DisplayObject;

	import flash.display.Sprite;

	import model.MainModel;

	import controller.game.BoardPresenter;
	import controller.game.HUDPresenter;

	import controller.main.MainStateMachine;

	import view.MainView;

	public class ServiceLocator {

		//--------------------------------------------------------
		// Singleton Stuff
		private static var _instance:ServiceLocator;
		public static function get instance():ServiceLocator {
			if (!_instance) {
				_instance = new ServiceLocator(new Lock());
			}
			return _instance;
		}

		//--------------------------------------------------------
		// Main
		private var _app:Minesweeper;
		private var _mainStateMachine:MainStateMachine;
		private var _mainModel:MainModel;
		private var _mainView:MainView;

		public function get app():Minesweeper { return _app; }
		public function get stage():DisplayObject { return app.stage; }
		public function get mainStateMachine():MainStateMachine { return _mainStateMachine;	}
		public function get mainModel():MainModel { return _mainModel; }
		public function get mainView():MainView { return _mainView; }

		//--------------------------------------------------------
		// Utils
		private var _mainRandom:Rndm;
		public function get mainRandom():Rndm { return _mainRandom; }

		//--------------------------------------------------------
		// Input
		private var _inputController:InputController;
		public function get inputController():InputController { return _inputController; }

		//--------------------------------------------------------
		// Game
		private var _hudPresenter:HUDPresenter;
		private var _boardPresenter:BoardPresenter;

		public function get hudPresenter():HUDPresenter { return _hudPresenter; }
		public function get boardPresenter():BoardPresenter { return _boardPresenter; }

		//--------------------------------------------------------

		//--------------------------------------------------------
		public function ServiceLocator(lock:Lock) {}

		public function init(app:Minesweeper):void {
			_app = app;
			_mainModel = new MainModel();
			_mainView = new MainView();
			_mainStateMachine = new MainStateMachine();

			_mainRandom = new Rndm(_mainModel.mainRandomSeed);
			_inputController = new InputController();

			_hudPresenter = new HUDPresenter();
			_boardPresenter = new BoardPresenter();

		}





	}
}

class Lock {}