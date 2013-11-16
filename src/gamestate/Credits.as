package gamestate 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Credits extends MovieClip
	{
		private var gamestatemanager:GamestateManager;
		private var creditsscreen:CreditsScreen = new CreditsScreen;
		public function Credits(manager:GamestateManager) 
		{
			gamestatemanager = manager;
			addChild(creditsscreen);
		}
		
	}

}