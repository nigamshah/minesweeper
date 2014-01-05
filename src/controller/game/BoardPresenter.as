/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 5:21 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game {
	import controller.game.cell.CellPresenter;

	import model.BoardModel;

	import utils.ServiceLocator;

	import view.BoardView;

	public class BoardPresenter {

		private var _boardView:BoardView;
		private var _cells:Vector.<Vector.<CellPresenter>>;

		public function get boardView():BoardView {
			return _boardView;
		}

		public function BoardPresenter() {
			_boardView = new BoardView();
		}

		public function reset():void {
			dispose();
			_boardView.clear();
			_cells = new Vector.<Vector.<CellPresenter>>();

			var boardModel:BoardModel = ServiceLocator.instance.mainModel.currentGameModel.boardModel;

			for (var col:int = 0; col < boardModel.numColumns; col++) {
				_cells[col] = new Vector.<CellPresenter>();
				for (var row:int = 0; row < boardModel.numRows; row++) {
					var cellPresenter:CellPresenter = CellPresenter.create(boardModel.cells[col][row]);
					_boardView.addCell(cellPresenter.cellView, col, row);
					_cells[col][row] = cellPresenter;
				}
			}
			_boardView.resetPosition();
		}

		public function dispose():void {
			for each (var col:Vector.<CellPresenter> in _cells) {
				for each (var cell:CellPresenter in col) {
					CellPresenter.releaseToPool(cell);
				}
			}
			_cells = null;
		}
	}
}
