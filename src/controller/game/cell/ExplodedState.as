/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 9:04 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game.cell {
	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	public class ExplodedState extends State {
		public static const ID:String = "exploded";

		public function ExplodedState(machine:StateMachine) {
			super(ID,  machine);
		}
	}
}