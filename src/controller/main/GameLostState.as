/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 7:20 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.main {
	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	import utils.ServiceLocator;

	public class GameLostState extends State {

		public static const ID:String = "gameWon";

		public function GameLostState(machine:StateMachine) {
			super(ID, machine);
		}

		override public function onEnter(data:Object):void {
			trace("YOU LOSE!!!!");
			ServiceLocator.instance.boardPresenter.revealAllMines();
			ServiceLocator.instance.mainView.gameView.gameLost();
		}
	}
}
