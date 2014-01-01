package {

	import flash.text.TextField;
	import flash.display.Sprite;

	public class Minesweeper extends Sprite {
		public function Minesweeper() {
			var textField:TextField = new TextField();
			textField.text = "Hello, World";
			addChild(textField);
			trace("Hello console");
		}
	}
}
