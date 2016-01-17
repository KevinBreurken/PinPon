package utils.calculate {

	import flash.display.MovieClip;

	public class Measure {
	
		public static function measureBetweenPoints( x1 : int , x2 : int , y1 : int , y2 : int ) : int {
		
			var distX : Number = x1 - x2;
			var distY : Number = y1 - y2;
			
			return Math.sqrt( distX * distX + distY * distY );
			
		}
		
	}

}