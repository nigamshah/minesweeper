/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 5:22 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.game {
	import utils.ServiceLocator;

	import view.HUDView;

	public class HUDPresenter {

		private var _hudView:HUDView;
		public function get hudView():HUDView { return _hudView; }

		public function HUDPresenter() {
			_hudView = new HUDView();
		}

		public function reset():void {
			_hudView.setSecondsElapsed(0);
			_hudView.setMinesRemaining(ServiceLocator.instance.mainModel.currentGameModel.boardModel.numMines);
		}
	}
}
