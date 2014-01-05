/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/2/14
 * Time: 11:13 PM
 * To change this template use File | Settings | File Templates.
 */
package view {

	import assets.MenuButton_mc;
	import assets.MenuTitle;

	import config.GameConfig;

	import controller.main.MainStateMachine;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	import utils.ServiceLocator;

	public class MenuView extends Sprite {

		private var _buttons:Dictionary;

		public function MenuView() {
			_buttons = new Dictionary();

			var title:MenuTitle = new MenuTitle();
			title.x = 300;
			title.y = 150;
			addChild(title);

			// set up buttons
			var configs:Vector.<GameConfig> = ServiceLocator.instance.mainModel.gameConfigs;
			for (var i:int = 0; i < configs.length; i++) {
				var btn:MenuButton_mc = new MenuButton_mc();
				btn.labelText.text = configs[i].description;
				btn.labelText.mouseEnabled = false;

				btn.buttonMode = true;
				btn.mouseChildren = false;
				btn.useHandCursor = true; // NOTE: there is bug on Mac / Chrome (some versions). Verified working in Safari.
				btn.x = 300;
				btn.y = 235 + i*100;
				btn.addEventListener(MouseEvent.CLICK, onMenuButtonClick);
				addChild(btn);
				_buttons[btn] = configs[i];
			}
		}

		private function onMenuButtonClick(evt:MouseEvent):void {
			var btn:MenuButton_mc = evt.target as MenuButton_mc;
			if (!btn) throw new Error("Target is not a menu button");
			var gameConfig:GameConfig = GameConfig(_buttons[btn]);
			trace("clicked on -- " + gameConfig.id);
			ServiceLocator.instance.mainStateMachine.handleTrigger(MainStateMachine.TRIGGER_LEVEL_SELECTED, gameConfig);

		}
	}
}
