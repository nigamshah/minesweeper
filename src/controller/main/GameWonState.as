/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 12:56 AM
 * To change this template use File | Settings | File Templates.
 */
package controller.main {
	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	public class GameWonState extends State {
		public static const ID:String = "gameWon";

		public function GameWonState(machine:StateMachine) {
			super(ID, machine);
		}

		override public function onEnter(data:Object):void {
			trace("YOU WIN!!!!");
		}
	}
}
