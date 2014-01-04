/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 12:53 AM
 * To change this template use File | Settings | File Templates.
 */
package stateMachine.main {
	import config.GameConfig;

	import stateMachine.State;
	import stateMachine.StateMachine;

	import utils.ServiceLocator;

	public class MenuState extends State {
		public static const ID:String = "menu";

		public function MenuState(machine:StateMachine) {
			super(ID, machine);
		}

		public override function onEnter(data:Object):void {
			ServiceLocator.instance.mainView.menuView.visible = true;
			ServiceLocator.instance.mainView.hudView.visible = false;
			ServiceLocator.instance.mainView.boardView.visible = false;
		}

		public override function onExit(data:Object):void {
			var gameConfig:GameConfig = GameConfig(data);
			trace("about to set up GameMode of type = " + gameConfig.id);
		}

	}
}
