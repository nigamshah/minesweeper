/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 12:55 AM
 * To change this template use File | Settings | File Templates.
 */
package controller.main {
	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	import flash.events.Event;

	import model.BoardModel;

	import utils.ServiceLocator;

	public class GameInProgressState extends State {
		public static const ID:String = "gameInProgress";

		public function GameInProgressState(machine:StateMachine) {
			super(ID, machine);
		}
		override public function onEnter(data:Object):void {
			ServiceLocator.instance.mainModel.currentGameModel.boardModel.addEventListener(BoardModel.BOARD_CLEARED, onBoardCleared);
			ServiceLocator.instance.mainModel.currentGameModel.startGame();
			ServiceLocator.instance.hudPresenter.startGame();
		}
		override public function onExit(data:Object):void {
			ServiceLocator.instance.mainModel.currentGameModel.endGame();
			ServiceLocator.instance.hudPresenter.endGame();
		}

		private function onBoardCleared(evt:Event):void {
			_machine.handleTrigger(MainStateMachine.TRIGGER_BOARD_CLEARED);
		}
	}
}
