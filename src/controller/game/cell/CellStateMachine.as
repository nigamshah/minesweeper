/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 8:56 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game.cell {
	import controller.game.cell.CellPresenter;
	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	public class CellStateMachine extends StateMachine {

		public static const TRIGGER_TOGGLE_FLAG:String = "toggleFlag";
		public static const TRIGGER_USER_CLEAR_CELL:String = "userClearCell";
		public static const TRIGGER_SYSTEM_REVEAL_CELL:String = "systemRevealCell";
		public static const TRIGGER_MINE_TRIPPED:String = "mineTripped";
		public static const TRIGGER_RESET:String = "reset";

		private var _presenter:CellPresenter;
		public function get presenter():CellPresenter {
			return _presenter;
		}

		public function CellStateMachine(presenter:CellPresenter) {
			_presenter = presenter;
		}

		public override function init():void {

			// states
			var unmarked:State = new UnmarkedState(this);
			var flagged:State = new FlaggedState(this);
			var revealed:State = new RevealedState(this);
			var exploded:State = new ExplodedState(this);

			// transitions
			unmarked.addTransition(TRIGGER_TOGGLE_FLAG, flagged);
			unmarked.addTransition(TRIGGER_USER_CLEAR_CELL, revealed);
			unmarked.addTransition(TRIGGER_SYSTEM_REVEAL_CELL, revealed);
			flagged.addTransition(TRIGGER_TOGGLE_FLAG, unmarked);
			revealed.addTransition(TRIGGER_MINE_TRIPPED, exploded);

			flagged.addTransition(TRIGGER_RESET, unmarked);
			revealed.addTransition(TRIGGER_RESET, unmarked);
			exploded.addTransition(TRIGGER_RESET, unmarked);

			this.doTransition(unmarked);
		}
	}
}
