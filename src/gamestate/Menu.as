package gamestate 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Menu extends MovieClip
	{
		private var gamestatemanager:GamestateManager;
		
		private var menubackground:MenuBackground = new MenuBackground;
		private var startbutton:StartButton = new StartButton;
		private var optionsbutton:OptionsButton = new OptionsButton;
		private var creditsbutton:CreditsButton = new CreditsButton;
		
		public function Menu(manager:GamestateManager) 
		{
			gamestatemanager = manager;
			
			addChild(menubackground);
			addChild(startbutton);
			addChild(optionsbutton);
			addChild(creditsbutton);
			
			setPosition(startbutton, 250, 360);
			setPosition(optionsbutton, 250, 570);
			setPosition(creditsbutton, 250, 730);
			
			startbutton.addEventListener(MouseEvent.CLICK, openGame);
			optionsbutton.addEventListener(MouseEvent.CLICK, openOptions);
			creditsbutton.addEventListener(MouseEvent.CLICK, openCredits);
		}
		private function openGame(e:MouseEvent):void 
		{
			unloadMenu();
			gamestatemanager.switchGamestate("Game");
		}
		private function openCredits(e:MouseEvent):void 
		{
			unloadMenu();
			gamestatemanager.switchGamestate("Credits");
		}
		private function openOptions(e:MouseEvent):void 
		{
			unloadMenu();
			gamestatemanager.switchGamestate("Options");
		}
		private function unloadMenu():void {
			while (this.numChildren > 0){ this.removeChildAt(0); }
		}
		private function setPosition(mc:MovieClip, x:int, y:int):void 
		{
			mc.x = x;
			mc.y = y;
		}
	}

}