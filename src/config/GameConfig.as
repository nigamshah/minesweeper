/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/2/14
 * Time: 11:16 PM
 * To change this template use File | Settings | File Templates.
 */
package config {
	public class GameConfig {

		private var _id:String;
		private var _description:String;
		private var _numColumns:int;
		private var _numRows:int;
		private var _numMines:int;
		private var _forceCascadeFirstMove:Boolean;

		public function GameConfig() {
		}

		public function get id():String {
			return _id;
		}

		public function set id(value:String):void {
			_id = value;
		}

		public function get description():String {
			return _description;
		}

		public function set description(value:String):void {
			_description = value;
		}

		public function get numColumns():int {
			return _numColumns;
		}

		public function set numColumns(value:int):void {
			_numColumns = value;
		}

		public function get numRows():int {
			return _numRows;
		}

		public function set numRows(value:int):void {
			_numRows = value;
		}

		public function get numMines():int {
			return _numMines;
		}

		public function set numMines(value:int):void {
			_numMines = value;
		}

		public function get forceCascadeFirstMove():Boolean {
			return _forceCascadeFirstMove;
		}

		public function set forceCascadeFirstMove(value:Boolean):void {
			_forceCascadeFirstMove = value;
		}

	}
}
