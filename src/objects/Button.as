package objects 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Button extends MovieClip
	{
		private var button:MovieClip;
		public function Button(mc:MovieClip,x:int,y:int) 
		{
			button = mc;
			addChild(button);
			button.gotoAndStop(1);
			button.x = x;
			button.y = y;
			addEventListener(MouseEvent.MOUSE_OVER, mouseover);
			addEventListener(MouseEvent.MOUSE_OUT, mouseout);
		}
		public function mouseover(e:MouseEvent):void {
			button.gotoAndStop(2);
		}
		public function mouseout(e:MouseEvent):void {
			button.gotoAndStop(1);
		}
	}

}