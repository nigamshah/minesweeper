package {

	import assets.HUD_mc;

	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.display.Sprite;

	import utils.ServiceLocator;

	[SWF(backgroundColor="0x9999FF" , width="600" , height="600")]
	public class Minesweeper extends Sprite {
		public function Minesweeper() {
			trace("Hello console");

			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			ServiceLocator.instance.init();
			addChild(ServiceLocator.instance.mainView);
			ServiceLocator.instance.mainStateMachine.init();

		}
	}
}
