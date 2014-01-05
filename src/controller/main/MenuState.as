/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 12:53 AM
 * To change this template use File | Settings | File Templates.
 */
package controller.main {
	import config.GameConfig;

	import model.GameModel;

	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	import utils.ServiceLocator;

	public class MenuState extends State {
		public static const ID:String = "menu";

		public function MenuState(machine:StateMachine) {
			super(ID, machine);
		}

		public override function onEnter(data:Object):void {
			ServiceLocator.instance.mainView.menuView.visible = true;
			ServiceLocator.instance.mainView.gameView.visible = false;
		}

		public override function onExit(data:Object):void {
			ServiceLocator.instance.mainView.menuView.visible = false;
		}

	}
}
