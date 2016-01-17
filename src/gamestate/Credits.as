package gamestate {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Credits extends MovieClip {
	
		private var gamestatemanager : GamestateManager;
		private var backbutton : BackButton = new BackButton;
		private var creditsscreen : CreditsScreen = new CreditsScreen;
		
		public function Credits ( manager : GamestateManager ) {
			
			gamestatemanager = manager;
			addChild(creditsscreen);
			addChild(backbutton);
			backbutton.y = 0;
			backbutton.addEventListener(MouseEvent.CLICK, toMenu);
			
		}
		
		private function toMenu( e : MouseEvent): void {
		
			gamestatemanager.musicmanager.playSound("Gong");
			removeChild(creditsscreen);
			removeChild(backbutton);
			
			gamestatemanager.switchGamestate("Menu");
			
		}
		
	}

}