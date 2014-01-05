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

	public class GameLostState extends State {

		public static const ID:String = "gameWon";

		public function GameLostState(machine:StateMachine) {
			super(ID, machine);
		}
	}
}
