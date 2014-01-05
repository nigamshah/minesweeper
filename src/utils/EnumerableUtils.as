/**
 * Created with IntelliJ IDEA.
 * User: nigamshah
 * Date: 1/4/14
 * Time: 11:31 PM
 * To change this template use File | Settings | File Templates.
 */
package utils {
	public class EnumerableUtils {

		public static function ArrayShuffle(arr:Array, copy:Boolean = false, random:Rndm = null):Array {
			if (copy) {
				arr = arr.concat();
			}
			if (random == null) {
				random = ServiceLocator.instance.mainRandom;
			}

			var l:int = arr.length;
			var i:int;
			var tmp:*;

			while(l--) {
				tmp = arr[l];
				i = random.integer(0, l+1);
				arr[l] = arr[i];
				arr[i] = tmp;
			}
			return arr;
		}
	}
}
