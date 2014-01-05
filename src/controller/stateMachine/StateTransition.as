/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/2/14
 * Time: 11:45 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.stateMachine {
	public class StateTransition {

		private var _triggerMessage:String;
		private var _sourceState:State;
		private var _targetState:State;


		public function get triggerMessage():String {
			return _triggerMessage;
		}

		public function get sourceState():State {
			return _sourceState;
		}

		public function get targetState():State {
			return _targetState;
		}

		public function StateTransition(triggerMessage:String,  source:State,  target:State) {
			_triggerMessage = triggerMessage;
			_sourceState = source;
			_targetState = target;
		}
	}
}
