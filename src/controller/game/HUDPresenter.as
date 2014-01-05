/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 5:22 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game {
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	import model.BoardModel;

	import utils.ServiceLocator;

	import view.HUDView;

	public class HUDPresenter {

		private var _timer:Timer;

		private var _hudView:HUDView;
		public function get hudView():HUDView { return _hudView; }

		public function HUDPresenter() {
			_hudView = new HUDView();
			_timer = new Timer(500);
			_timer.addEventListener(TimerEvent.TIMER, onTick);
		}

		public function reset():void {
			_hudView.setSecondsElapsed(0);
			_hudView.setMinesRemaining(ServiceLocator.instance.mainModel.currentGameModel.gameConfig.numMines);

			ServiceLocator.instance.mainModel.currentGameModel.boardModel.addEventListener(Event.CHANGE, onBoardModelChanged);
		}
		public function dispose():void {
			_timer.removeEventListener(TimerEvent.TIMER, onTick);

		}

		public function startGame():void {
			_timer.start();
		}

		public function endGame():void {
			ServiceLocator.instance.mainModel.currentGameModel.boardModel.removeEventListener(Event.CHANGE, onBoardModelChanged);
			_timer.stop();
		}


		private function onBoardModelChanged(evt:Event):void {
			var boardModel:BoardModel = ServiceLocator.instance.mainModel.currentGameModel.boardModel;

			// Note: it can go into negative numbers - this is consistent with the Minesweeper games I have seen
			_hudView.setMinesRemaining(boardModel.numMines - boardModel.numFlags);
		}

		private function onTick(evt:Event):void {
			var elapsed:Number = getTimer() - ServiceLocator.instance.mainModel.currentGameModel.gameStart;
			_hudView.setSecondsElapsed(Math.floor(elapsed/1000));
		}


	}
}
