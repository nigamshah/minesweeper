/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 9:02 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game.cell {
	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	public class FlaggedState extends State {
		public static const ID:String = "flagged";

		public function FlaggedState(machine:StateMachine) {
			super(ID,  machine);
		}

		public override function onEnter(data:Object):void {
			var presenter:CellPresenter = CellStateMachine(_machine).presenter;
			presenter.cellView.setFlag(true);
		}
		public override function onExit(data:Object):void {
			var presenter:CellPresenter = CellStateMachine(_machine).presenter;
			presenter.cellView.setFlag(false);
		}
	}
}
