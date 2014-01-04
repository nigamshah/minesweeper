/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/2/14
 * Time: 11:27 PM
 * To change this template use File | Settings | File Templates.
 */
package model {
	import config.GameConfig;

	public class GameModel {

		private var _gameConfig:GameConfig;
		private var _boardModel:BoardModel;
		private var _gameStart:uint;
		private var _gameDuration:uint;

		public function get gameConfig():GameConfig {
			return _gameConfig;
		}

		public function set gameConfig(value:GameConfig):void {
			_gameConfig = value;
		}

		public function get boardModel():BoardModel {
			return _boardModel;
		}

		public function set boardModel(value:BoardModel):void {
			_boardModel = value;
		}

		public function get gameStart():uint {
			return _gameStart;
		}

		public function set gameStart(value:uint):void {
			_gameStart = value;
		}

		public function get gameDuration():uint {
			return _gameDuration;
		}

		public function set gameDuration(value:uint):void {
			_gameDuration = value;
		}

		public function GameModel() {
		}
	}
}
