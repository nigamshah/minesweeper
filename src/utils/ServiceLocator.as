/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 7:32 PM
 * To change this template use File | Settings | File Templates.
 */
package utils {
	import model.MainModel;

	import presenter.BoardPresenter;
	import presenter.HUDPresenter;

	import stateMachine.main.MainStateMachine;

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
		private var _mainStateMachine:MainStateMachine;
		private var _mainModel:MainModel;
		private var _mainView:MainView;

		public function get mainStateMachine():MainStateMachine { return _mainStateMachine;	}
		public function get mainModel():MainModel { return _mainModel; }
		public function get mainView():MainView { return _mainView; }

		//--------------------------------------------------------
		// Game
		private var _hudPresenter:HUDPresenter;
		private var _boardPresenter:BoardPresenter;

		public function get hudPresenter():HUDPresenter { return _hudPresenter; }
		public function get boardPresenter():BoardPresenter { return _boardPresenter; }

		//--------------------------------------------------------

		//--------------------------------------------------------
		public function ServiceLocator(lock:Lock) {}

		public function init():void {
			_mainModel = new MainModel();
			_mainView = new MainView();
			_mainStateMachine = new MainStateMachine();

			_hudPresenter = new HUDPresenter();
			_boardPresenter = new BoardPresenter();

		}





	}
}

class Lock {}