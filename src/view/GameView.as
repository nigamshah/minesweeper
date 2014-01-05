/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 4:02 PM
 * To change this template use File | Settings | File Templates.
 */
package view {
	import assets.LoseMessage;
	import assets.WinMessage;

	import flash.display.MovieClip;

	import flash.display.Sprite;

	import utils.ServiceLocator;

	public class GameView extends Sprite {

		public function GameView() {
			reset();
		}

		public function gameWon():void {
			var msg:MovieClip = new WinMessage();
			addChild(msg);
		}
		public function gameLost():void {
			var msg:MovieClip = new LoseMessage();
			addChild(msg);
		}
		public function reset():void {
			while(numChildren) removeChildAt(0);
			addChild(ServiceLocator.instance.hudPresenter.hudView);
			addChild(ServiceLocator.instance.boardPresenter.boardView);
		}
	}
}
