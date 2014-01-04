/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/2/14
 * Time: 11:24 PM
 * To change this template use File | Settings | File Templates.
 */
package model {
	import config.GameConfig;

	public class MainModel {
		private var _gameConfigs:Vector.<GameConfig>; // (available are Easy, Medium, Hard)
		private var _currentGameModel:GameModel;

		public function MainModel() {

			_gameConfigs = new Vector.<GameConfig>();

			// typically this data would come from an external text file
			var gameConfig:GameConfig = new GameConfig();
			gameConfig.id = "easy";
			gameConfig.description = "Easy: 9x9, 10 mines";
			gameConfig.numColumns = 9;
			gameConfig.numRows = 9;
			gameConfig.numMines = 10;
			_gameConfigs.push(gameConfig);

			gameConfig = new GameConfig();
			gameConfig.id = "medium";
			gameConfig.description = "Medium: 12x12, 30 mines";
			gameConfig.numColumns = 12;
			gameConfig.numRows = 12;
			gameConfig.numMines = 40;
			_gameConfigs.push(gameConfig);

			gameConfig = new GameConfig();
			gameConfig.id = "hard";
			gameConfig.description = "Hard: 18x18, 40 mines";
			gameConfig.numColumns = 15;
			gameConfig.numRows = 15;
			gameConfig.numMines = 40;
			_gameConfigs.push(gameConfig);

		}

		public function get currentGameModel():GameModel {
			return _currentGameModel;
		}

		public function set currentGameModel(value:GameModel):void {
			_currentGameModel = value;
		}

		public function get gameConfigs():Vector.<GameConfig> {
			return _gameConfigs;
		}
	}
}
