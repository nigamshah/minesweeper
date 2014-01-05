/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 9:01 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game.cell {
	import controller.game.cell.CellPresenter;
	import controller.game.cell.CellStateMachine;
	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	public class UnmarkedState extends State {

		public static const ID:String = "unmarked";

		public function UnmarkedState(machine:StateMachine) {
			super(ID, machine);
		}

		override public function onEnter(data:Object):void {
			var presenter:CellPresenter = CellStateMachine(_machine).presenter;
			presenter.cellView.setFlag(false);
		}


	}
}
