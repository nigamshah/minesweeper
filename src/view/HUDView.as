/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/2/14
 * Time: 10:57 PM
 * To change this template use File | Settings | File Templates.
 */
package view {
	import assets.HUD_mc;

	import controller.main.MainStateMachine;

	import flash.display.MovieClip;
	import flash.display.SimpleButton;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	import utils.ServiceLocator;

	public class HUDView extends Sprite {


		private var _minesCounterLabel:TextField;
		private var _secondsCounterLabel:TextField;
		private var _restartButton:SimpleButton;
		private var _menuButton:SimpleButton;

		public function HUDView() {

			var mc:HUD_mc = new HUD_mc();

			_minesCounterLabel = mc.minesCounter.numberText;
			_secondsCounterLabel = mc.secondsCounter.numberText;
			_restartButton = mc.playAgainButton;
			_menuButton = mc.menuButton;

			_restartButton.addEventListener(MouseEvent.CLICK, onRestartClick);
			_menuButton.addEventListener(MouseEvent.CLICK, onMenuClick);

			addChild(mc);

			graphics.beginFill(0xcccccc);
			graphics.drawRect(0, 0, 600, 100);
		}

		public function setMinesRemaining(numMinesRemaining:int):void {
			_minesCounterLabel.text = String(numMinesRemaining);
		}

		public function setSecondsElapsed(secondsElapsed:int):void {
			secondsElapsed = Math.min(secondsElapsed, 999);
			_secondsCounterLabel.text = String(secondsElapsed);
		}

		private function onRestartClick(evt:MouseEvent):void {
			trace("Clicked on Restart from the HUD");
			ServiceLocator.instance.mainStateMachine.handleTrigger(MainStateMachine.TRIGGER_PLAY_AGAIN);
		}
		private function onMenuClick(evt:MouseEvent):void {
			trace("Clicked on Menu from the HUD");
			ServiceLocator.instance.mainStateMachine.handleTrigger(MainStateMachine.TRIGGER_GO_TO_MENU);
		}

		public function dispose():void {
			_restartButton.removeEventListener(MouseEvent.CLICK, onRestartClick);
		}

	}
}
