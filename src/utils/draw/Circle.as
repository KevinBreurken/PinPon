package  utils.draw
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Circle extends Sprite
	{
		public var color:uint;
		public var radius:Number;
		public var line:Number
		
		public function Circle($x:Number, $y:Number, radius:Number, color:uint,line:Number)
		{
		this.radius = radius;
		this.color = color;
		this.line=line
		this.x = $x;
		this.y = $y;
		this.radius = radius;
		
		if(line!=0){this.graphics.lineStyle(line);}
		this.graphics.beginFill(this.color);
		this.graphics.drawCircle(0, 0, this.radius);
		}
		//public function draw():void
		//{
			//this.graphics.endFill();
			//if(line!=0){this.graphics.lineStyle(line);}
			//this.graphics.beginFill(color);
			//this.graphics.drawCircle(0, 0, radius);
		//}

	}
}