/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 10:00 PM
 * To change this template use File | Settings | File Templates.
 */
package utils {
	import config.GameConfig;

	import model.BoardModel;

	import model.CellModel;

	import model.GameModel;

	public class GameFactory {

		public static function createGameModel(gameConfig:GameConfig):GameModel {
			var gameModel:GameModel = new GameModel();
			gameModel.gameConfig = gameConfig;

			gameModel.boardModel = new BoardModel(gameConfig.numColumns, gameConfig.numRows);

			// cells
			var cells:Vector.<Vector.<CellModel>> = new Vector.<Vector.<CellModel>>();

			for (var col:int = 0; col < gameConfig.numColumns; col++) {
				cells[col] = new Vector.<CellModel>();
				for (var row:int = 0; row < gameConfig.numRows; row++) {
					var cellModel:CellModel = CellModel.create();
					cellModel.columnIndex = col;
					cellModel.rowIndex = row;
					cells[col][row] = cellModel;
				}
			}
			gameModel.boardModel.cells = cells;
			return gameModel;
		}

	}
}
