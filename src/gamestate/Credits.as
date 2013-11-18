package gamestate 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Credits extends MovieClip
	{
		private var gamestatemanager:GamestateManager;
		private var backbutton:BackButton = new BackButton;
		private var creditsscreen:CreditsScreen = new CreditsScreen;
		public function Credits(manager:GamestateManager) 
		{
			
			gamestatemanager = manager;
			addChild(creditsscreen);
			addChild(backbutton);
			backbutton.y = -50;
			backbutton.addEventListener(MouseEvent.CLICK, toMenu);
		}
		private function toMenu(e:MouseEvent):void {
			removeChild(creditsscreen);
			removeChild(backbutton);
			gamestatemanager.switchGamestate("Menu");
		}
		
	}

}