/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/3/14
 * Time: 8:11 PM
 * To change this template use File | Settings | File Templates.
 */
package view {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.Dictionary;

	import model.BoardModel;

	import utils.ServiceLocator;

	public class BoardView extends Sprite {

		private var _cells:Vector.<Vector.<CellView>>;
		private var _cellMap:Dictionary;

		public function BoardView() {
		}

		public function reset():void {
			dispose();
			_cells = new Vector.<Vector.<CellView>>();
			_cellMap = new Dictionary(true);

			var boardModel:BoardModel = ServiceLocator.instance.mainModel.currentGameModel.boardModel;

			for (var col:int = 0; col < boardModel.numColumns; col++) {
				_cells[col] = new Vector.<CellView>();
				for (var row:int = 0; row < boardModel.numRows; row++) {
					var cellView:CellView = CellView.create();
					cellView.x = col * CellView.CELL_SIZE;
					cellView.y = row * -1 * CellView.CELL_SIZE;
					cellView.addEventListener(MouseEvent.CLICK, onCellClick);
					addChild(cellView);
					_cells[col][row] = cellView;
					_cellMap[cellView] = new Point(col, row);
				}
			}
			x = (stage.stageWidth - width)/2;
			y = stage.stageHeight - ((stage.stageHeight - 100) - height)/2;
		}

		public function dispose():void {
			for each (var col:Vector.<CellView> in _cells) {
				for each (var cell:CellView in col) {
					CellView.releaseToPool(cell);
				}
			}
			_cells = null;
			_cellMap = null;

			while(numChildren) removeChildAt(0);
		}

		private function onCellClick(evt:MouseEvent):void {
			var cellView:CellView = CellView(evt.currentTarget);
			var point:Point = Point(_cellMap[cellView]);
			var col:int = point.x;
			var row:int = point.y;

			trace("Clicked on cell: " + col, row);
		}
	}
}
