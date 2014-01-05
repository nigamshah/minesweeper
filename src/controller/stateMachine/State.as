/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/2/14
 * Time: 11:42 PM
 * To change this template use File | Settings | File Templates.
 */
package controller.stateMachine {
	import flash.net.ObjectEncoding;
	import flash.utils.Dictionary;

	public class State {

		private var _id:String;
		public function get id():String { return _id; }

		private var _transitions:Dictionary;
		protected var _machine:StateMachine;

		public function State(id:String, machine:StateMachine) {
			_id = id;
			_machine = machine;
			_transitions = new Dictionary();
		}

		public function addTransition(triggerMessage:String, targetState:State):void {
			if (!triggerMessage || !targetState) throw new Error("Illegal Transition");
			_transitions[triggerMessage] = new StateTransition(triggerMessage, this, targetState);
		}

		public function hasTransition(triggerMessage:String):Boolean {
			var result:Boolean = _transitions.hasOwnProperty(triggerMessage) && _transitions[triggerMessage] is StateTransition;
			return result;
		}

		public function getTargetState(triggerMessage:String):State {
			if (hasTransition(triggerMessage)) {
				return StateTransition(_transitions[triggerMessage]).targetState;
			}
			return null;
		}

		public function onEnter(data:Object):void {

		}
		public function onExit(data:Object):void {

		}


	}
}
