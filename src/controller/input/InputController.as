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

		private var _ctlDown:Boolean;
		public function get ctlDown():Boolean {	return _ctlDown; }

		public function InputController() {
			ServiceLocator.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			ServiceLocator.instance.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);

		}

		private function onKeyDown(evt:KeyboardEvent):void {
			_ctlDown = evt.ctrlKey;
		}

		private function onKeyUp(evt:KeyboardEvent):void {
			_ctlDown = evt.ctrlKey;
		}
	}
}
