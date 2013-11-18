package  objects
{
	import flash.events.Event;
	import utils.movement.staticOrbit;
	import utils.calculate.Measure;
	import utils.calculate.Random;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Ball extends staticOrbit 
	{
		public var mc:BallArt = new BallArt;
		private var changeSpeedRadius:Number = 2;
		public var updown:Boolean;
		public var lasthitted:int = 0;
		public var distance:int;
		public function Ball() 
		{
			addChild(mc);
			this.x = Globals.origin.x;
			this.y = Globals.origin.y;
			radius = 0;
			addEventListener(Event.ENTER_FRAME, update);
		}
		public function update(e:Event):void 
		{
		distance = Measure.measureBetweenPoints(this.x, 500, this.y, 500);
		if (radius < 1)
		{
			updown = false;
			radius = 1;
			angle += 180;
			speed = 10;
			changeSpeedRadius = Random.randomRange(2, 5);
		}
		switch(updown)
		{
		case true:
			radius -= changeSpeedRadius;
			speed += 0.0;
		break;
		case false:
			radius += changeSpeedRadius;
			speed -= 0.00;
		break;
		}
		Update(radius, speed);	
		
		var rad:Number = angle * (Math.PI / 180); // Converting Degrees To Radians
			if (isball) {
				if (distance <= 50) {
					losegravity = false;
				}
				else {
					losegravity = true;
				}
				angle -= speed;
				if (!losegravity) {
					this.x = origin.x + radius * Math.cos(rad); // Position The this Along x-axis
					this.y = origin.y + radius * Math.sin(rad); // Position The this Along y-axis
				}
				else {
				if(updown){
					this.x -= 8 * Math.cos(this.rotation * Math.PI/180);
					this.y -= 8 * Math.sin(this.rotation * Math.PI / 180);
					}
					else {
					this.x += 8 * Math.cos(this.rotation * Math.PI/180);
					this.y += 8 * Math.sin(this.rotation * Math.PI / 180);
					}
				}
			}
		}
		
	}

}