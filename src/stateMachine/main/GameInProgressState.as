/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 12:55 AM
 * To change this template use File | Settings | File Templates.
 */
package stateMachine.main {
	import stateMachine.State;
	import stateMachine.StateMachine;

	public class GameInProgressState extends State {
		public static const ID:String = "gameInProgress";

		public function GameInProgressState(machine:StateMachine) {
			super(ID, machine);
		}
	}
}
