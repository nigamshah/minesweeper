/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 9:04 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game.cell {
	import controller.main.MainStateMachine;
	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	import utils.ServiceLocator;

	public class ExplodedState extends State {
		public static const ID:String = "exploded";

		public function ExplodedState(machine:StateMachine) {
			super(ID,  machine);
		}

		override public function onEnter(data:Object):void {
			var presenter:CellPresenter = CellStateMachine(_machine).presenter;
			presenter.cellView.setExploded(true);

			ServiceLocator.instance.mainStateMachine.handleTrigger(MainStateMachine.TRIGGER_MINE_EXPLODED);
		}
	}
}