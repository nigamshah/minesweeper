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

		public static const TRIGGER_STARTUP_COMPLETE:String = "startupComplete";
		public static const TRIGGER_LEVEL_SELECTED:String = "levelSelected";
		public static const TRIGGER_MINES_GENERATED:String = "minesGenerated";
		public static const TRIGGER_GO_TO_MENU:String = "gotoMenu";
		public static const TRIGGER_MINE_EXPLODED:String = "mineExploded";
		public static const TRIGGER_BOARD_CLEARED:String = "boardCleared";
		public static const TRIGGER_PLAY_AGAIN:String = "playAgain";


		public function MainStateMachine() {}

		override public function init():void {

			//---------------
			// states
			var startup:StartupState = new StartupState(this);
			var menu:MenuState = new MenuState(this);
			var ready:GameReadyState = new GameReadyState(this);
			var inProgress:GameInProgressState = new GameInProgressState(this);
			var gameWon:GameWonState = new GameWonState(this);
			var gameLost:GameLostState = new GameLostState(this);

			//---------------
			// transitions
			startup.addTransition(TRIGGER_STARTUP_COMPLETE, menu);
			menu.addTransition(TRIGGER_LEVEL_SELECTED, ready);
			ready.addTransition(TRIGGER_MINES_GENERATED, inProgress);
			ready.addTransition(TRIGGER_GO_TO_MENU, menu);
			inProgress.addTransition(TRIGGER_MINE_EXPLODED, gameLost);
			inProgress.addTransition(TRIGGER_BOARD_CLEARED, gameWon);
			inProgress.addTransition(TRIGGER_PLAY_AGAIN, ready);
			inProgress.addTransition(TRIGGER_GO_TO_MENU, menu);
			gameWon.addTransition(TRIGGER_GO_TO_MENU, menu);
			gameWon.addTransition(TRIGGER_PLAY_AGAIN, ready);
			gameLost.addTransition(TRIGGER_GO_TO_MENU, menu);
			gameLost.addTransition(TRIGGER_PLAY_AGAIN, ready);

			//---------------
			this.doTransition(startup);
		}

	}
}
