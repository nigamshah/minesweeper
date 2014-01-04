/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 12:55 AM
 * To change this template use File | Settings | File Templates.
 */
package stateMachine.main {
	import config.GameConfig;

	import stateMachine.State;
	import stateMachine.StateMachine;

	import utils.GameFactory;

	import utils.ServiceLocator;

	public class GameReadyState extends State {
		public static const ID:String = "gameReady";

		public function GameReadyState(machine:StateMachine) {
			super(ID, machine);
		}

		public override function onEnter(data:Object):void {
			var gameConfig:GameConfig = GameConfig(data);
			trace("about to set up GameModel of type = " + gameConfig.id);

			ServiceLocator.instance.mainModel.currentGameModel = GameFactory.createGameModel(gameConfig);

			ServiceLocator.instance.mainView.gameView.reset();

			ServiceLocator.instance.mainView.gameView.visible = true;
			ServiceLocator.instance.mainView.menuView.visible = false;

		}
	}
}
