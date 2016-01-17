package utils.movement {

	import flash.display.Sprite;
	import flash.geom.Point;

	public class staticOrbit extends Sprite {
	
		public var origin : Point = Globals.origin; // The MovieClip That Is Orbited
		public var angle : Number = 0; // The Initial Angle Orbiting Starts From
		public var speed : Number = 3; // Number Of Pixels Orbited Per Frame
		public var radius : Number = 30; // Orbiting Distance From Origin
		public var isball : Boolean = false;
		public var losegravity : Boolean;
		
		public function Update ( radius : Number , speed : Number ) : void {
		
			var rad : Number = angle * ( Math.PI / 180 ); // Converting Degrees To Radians
			if (!isball) {
			
				angle -= speed;
				this.x = origin.x + radius * Math.cos(rad); // Position The this Along x-axis
				this.y = origin.y + radius * Math.sin(rad); // Position The this Along y-axis
				
			}
			
			this.rotation = (Math.atan2(this.y - origin.y, this.x - origin.x) * 180 / Math.PI);
			
		}
		
	}

}