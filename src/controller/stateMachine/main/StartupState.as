/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 12:51 AM
 * To change this template use File | Settings | File Templates.
 */
package controller.stateMachine.main {
	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	import utils.ServiceLocator;

	public class StartupState extends State {
		public static const ID:String = "startup";

		public function StartupState(machine:StateMachine) {
			super(ID, machine);
		}

		public override function onEnter(data:Object):void {
			ServiceLocator.instance.mainView.init();

			// any other startup stuff before the main menu goes here...

			_machine.handleTrigger("startupComplete");
		}


	}
}