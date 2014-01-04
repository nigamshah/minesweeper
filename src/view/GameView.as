/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 4:02 PM
 * To change this template use File | Settings | File Templates.
 */
package view {
	import flash.display.Sprite;

	import utils.ServiceLocator;

	public class GameView extends Sprite {

		public function GameView() {
			addChild(ServiceLocator.instance.hudPresenter.hudView);
			addChild(ServiceLocator.instance.boardPresenter.boardView);
		}

	}
}
