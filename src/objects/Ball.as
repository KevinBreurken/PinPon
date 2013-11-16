package  objects
{
	import flash.events.Event;
	import utils.movement.staticOrbit;
	import utils.calculate.Measure;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Ball extends staticOrbit 
	{
		public var mc:BallArt = new BallArt;
		private var changeSpeedRadius:Number = 2;
		public var updown:Boolean;
		public function Ball() 
		{
			addChild(mc);
			addEventListener(Event.ENTER_FRAME, update);
		}
		public function update(e:Event):void 
		{
		if (radius < 1)
		{
			updown = false;
			radius = 1;
			angle += 180;
			speed = 10;
			changeSpeedRadius = (Math.random() * 2) + 0.2;
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
		var distance:int = Measure.measureBetweenPoints(this.x, 500, this.y, 500);
			if (isball) {
				if (distance <= 50) {
					trace("IN");
					losegravity = false;
				}
				else {
					trace("OUT");
					losegravity = true;
				}
				angle -= speed;
				if (!losegravity) {
					this.x = origin.x + radius * Math.cos(rad); // Position The this Along x-axis
					this.y = origin.y + radius * Math.sin(rad); // Position The this Along y-axis
				}
				else {
				if(updown){
					this.x -= 5 * Math.cos(this.rotation * Math.PI/180);
					this.y -= 5 * Math.sin(this.rotation * Math.PI / 180);
					}
					else {
					this.x+= 5 * Math.cos(this.rotation * Math.PI/180);
					this.y += 5 * Math.sin(this.rotation * Math.PI / 180);
					}
				}
			}
		}
		
	}

}