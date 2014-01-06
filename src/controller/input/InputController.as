/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 7:08 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.input {
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;

	import utils.ServiceLocator;

	public class InputController {

		private var _secondaryKeyDown:Boolean;
		public function get secondaryKeyDown():Boolean {	return _secondaryKeyDown; }

		public function InputController() {
			ServiceLocator.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			ServiceLocator.instance.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}

		private function onKeyDown(evt:KeyboardEvent):void {
			_secondaryKeyDown = evt.ctrlKey || evt.shiftKey;
		}

		private function onKeyUp(evt:KeyboardEvent):void {
			_secondaryKeyDown = evt.ctrlKey || evt.shiftKey;
		}
	}
}
