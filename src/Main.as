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
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			gamestatemanager = new GamestateManager();
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace(stage);
			// entry point
			addChild(gamestatemanager);
			gamestatemanager.switchGamestate("Menu");
		}
		
	}
	
}