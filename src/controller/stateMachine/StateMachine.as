/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/2/14
 * Time: 11:44 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.stateMachine {
	import utils.IDisposable;

	public class StateMachine implements IDisposable {

		protected var _currentState:State;

		public function StateMachine() {
		}

		public function init():void {}

		protected function doTransition(targetState:State, data:Object = null):void {
			if (!targetState || _currentState == targetState) return;
			if (_currentState) {
				_currentState.onExit(data);
			}
			_currentState = targetState;
			_currentState.onEnter(data);
		}

		public function handleTrigger(triggerMessage:String, data:Object = null):void {
			var targetState:State = _currentState.getTargetState(triggerMessage);
			if (targetState) {
				doTransition(targetState, data);
			}
		}

		public function dispose():void {}




	}
}
