package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import gamestate.Game;
	import gamestate.GamestateManager;
	import gamestate.Menu;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Main extends Sprite 
	{
		public var gamestatemanager:GamestateManager;
		
		var bgshape:Sprite;
		var default_bg_color:uint = 0x000000;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			//stage.align = "TL";
			//stage.scaleMode = "noScale";
			bgshape = new Sprite();
			bgshape.graphics.beginFill(default_bg_color);
			bgshape.graphics.drawRect(-1000,0,5000, 2000);
			addChildAt(bgshape, 0);
			gamestatemanager = new GamestateManager();
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace(stage);
			// entry point
			addChild(gamestatemanager);
			gamestatemanager.switchGamestate("Menu");
		}
	}
	
}