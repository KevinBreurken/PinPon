package utils.movement 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class MovingObjects extends Sprite
	{
		public var destroy:Boolean = false;
		private var _anglelast:Number;
		private var _speedlast:Number;
		
		public function MovingObjects() 
		{
			
		}
		
		public function move($speed:Number=0,$angle:Number=0):void
		{
			var speed:Point;
			if ($angle == _anglelast && $speed == _speedlast);
			{
				if ($angle == 0)
				{
					speed = new Point();
					speed.x = Math.cos(this.rotation / 180 * Math.PI) * $speed;
					speed.y = Math.sin(this.rotation / 180 * Math.PI) * $speed;
				}
				else
				{
					speed = MathExstend.callMove($speed, $angle)
				}
				this.x += speed.x;
				this.y += speed.y;
				
				
				if (this.x < 0 || this.x > Main.resolution[0] || this.y > Main.resolution[1]||this.y<-40)
				{
					destroy = true;
				}
			}
			_anglelast = $angle;
		}
	}

}