/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 12:50 AM
 * To change this template use File | Settings | File Templates.
 */
package controller.main {
	import controller.stateMachine.StateMachine;

	public class MainStateMachine extends StateMachine {

		public function MainStateMachine() {}

		public override function init():void {
			// states
			var startup:StartupState = new StartupState(this);
			var menu:MenuState = new MenuState(this);
			var ready:GameReadyState = new GameReadyState(this);
			var inProgress:GameInProgressState = new GameInProgressState(this);
			var gameWon:GameWonState = new GameWonState(this);
			var gameLost:GameLostState = new GameLostState(this);

			// transitions
			startup.addTransition("startupComplete", menu);
			menu.addTransition("levelSelected", ready);
			ready.addTransition("firstMoveComplete", inProgress);
			ready.addTransition("gotoMenu", menu);
			inProgress.addTransition("mineExploded", gameLost);
			inProgress.addTransition("boardCleared", gameWon);
			inProgress.addTransition("playAgain", ready);
			inProgress.addTransition("gotoMenu", menu);
			gameWon.addTransition("gotoMenu", menu);
			gameWon.addTransition("playAgain", ready);
			gameLost.addTransition("gotoMenu", menu);
			gameLost.addTransition("playAgain", ready);

			this.doTransition(startup);
		}

	}
}
