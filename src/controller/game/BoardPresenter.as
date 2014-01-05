/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 5:21 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game {
	import controller.game.cell.CellPresenter;

	import flash.crypto.generateRandomBytes;

	import model.BoardModel;
	import model.CellModel;

	import utils.ServiceLocator;

	import view.BoardView;

	public class BoardPresenter {

		private var _boardView:BoardView;
		private var _boardModel:BoardModel;

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

			_boardModel = ServiceLocator.instance.mainModel.currentGameModel.boardModel;

			for (var col:int = 0; col < _boardModel.numColumns; col++) {
				_cells[col] = new Vector.<CellPresenter>();
				for (var row:int = 0; row < _boardModel.numRows; row++) {
					var cellPresenter:CellPresenter = CellPresenter.create(_boardModel.cells[col][row]);
					_boardView.addCell(cellPresenter.cellView, col, row);
					_cells[col][row] = cellPresenter;
				}
			}
			_boardView.resetPosition();
		}

		public function onClearCell(cell:CellPresenter):void {
			if (_boardModel.numMines == 0) {
				generateMines(cell);
			}
		}

		private function generateMines(cellPresenter:CellPresenter):void {
			_boardModel.generateMines(cellPresenter.cellModel);

			for each (var column:Vector.<CellPresenter> in _cells) {
				for each (var cell:CellPresenter in column) {
					cell.cellView.setMine(cell.cellModel.occupied);
					cell.cellView.setNumAdjacentMines(cell.cellModel.numAdjacentMines);
				}
			}

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
