package utils.calculate 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class MathExstend extends Sprite
	{
			/**
			 * @param speed that it will move at
			 * @param angle to move at
			 * 
			 * @return point with x speed and y speed
			 */
		public static function callMove(speed:Number, angle:Number):Point
		{
			
			var out:Point
			var speedx:Number = Math.cos(angle) * speed;
			var speedy:Number = Math.sin(angle) * speed;
			
			out = new Point(speedx,speedy)
			
			return out
		}
		
		/**
			 * @param obj1 Object that will rotate
			 * @param obj2 The Object that will be pointed at
			 * 
			 * @return Angle in degress
			 */
		public static function poinToMouse(obj1:Object,obj2:Object):Number 
		{
			
            var dX:Number 
            var dY:Number 
			
			
			//if (obj2 = null)
			//{
				//dX= mouseX - obj1.x;
				//dY = mouseY - obj1.y;
			//}
			//else
			//{
				dY = obj2.y - obj1.y;
				dX =  obj2.x - obj1.y;
			//}
            var angleDeg:Number = Math.atan2(dY, dX) / Math.PI * 180;
			
            return angleDeg;
		}
	}

}