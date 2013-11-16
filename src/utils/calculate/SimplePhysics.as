package utils.calculate 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class SimplePhysics 
	{
		private var _speedup:Number = 0;
		
		private var _speed:Number = 0;
		private var _angleLast:Number = 0;
		public function SimplePhysics() 
		{
			
		}
		
		public function get speedup():Number 
		{
			return _speedup;
		}
		
		public function set speedup(value:Number):void 
		{
			_speedup = value;
		}
		
		public function addForce(force:Point = new Point(0, 0))
		{
			_speed += force / 100;
		}
	}

}