/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 12:55 AM
 * To change this template use File | Settings | File Templates.
 */
package controller.main {
	import config.GameConfig;

	import controller.stateMachine.State;
	import controller.stateMachine.StateMachine;

	import flash.events.Event;

	import model.BoardModel;

	import utils.GameFactory;

	import utils.ServiceLocator;

	public class GameReadyState extends State {
		public static const ID:String = "gameReady";

		public function GameReadyState(machine:StateMachine) {
			super(ID, machine);
		}

		override public function onEnter(data:Object):void {
			var gameConfig:GameConfig = GameConfig(data);
			trace("about to set up GameModel of type = " + gameConfig.id);

			ServiceLocator.instance.mainModel.currentGameModel = GameFactory.createGameModel(gameConfig);

			ServiceLocator.instance.hudPresenter.reset();
			ServiceLocator.instance.boardPresenter.reset();

			ServiceLocator.instance.mainView.gameView.visible = true;
			ServiceLocator.instance.mainView.menuView.visible = false;

		}
	}
}
