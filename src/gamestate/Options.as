package gamestate 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class Options extends MovieClip
	{
		private var gamestatemanager:GamestateManager;
		
		private var optionsbackground:OptionsBackground = new OptionsBackground;
		private var bgmslider:OptionsSlider = new OptionsSlider;
		private var sfxslider:OptionsSlider = new OptionsSlider;
		private var backbutton:BackButton = new BackButton;
		public function Options(manager:GamestateManager) 
		{
			gamestatemanager = manager;
			addChild(optionsbackground);
			addChild(bgmslider);
			if(gamestatemanager.bgm){
				bgmslider.gotoAndStop(1);
			}
			else {
				bgmslider.gotoAndStop(2);	
			}
			bgmslider.x = 570;
			bgmslider.y = 355;
			addChild(sfxslider);
			if(gamestatemanager.sfx){
				sfxslider.gotoAndStop(1);
			}
			else {
				sfxslider.gotoAndStop(2);	
			}
			sfxslider.x = 570;
			sfxslider.y = 560;
			addChild(backbutton);
			backbutton.addEventListener(MouseEvent.CLICK, toMenu);
			bgmslider.addEventListener(MouseEvent.CLICK, clickbgm);
			sfxslider.addEventListener(MouseEvent.CLICK, clicksfx);
			
		}
		private function toMenu(e:MouseEvent):void {
			gamestatemanager.musicmanager.playSound("Gong");
			removeChild(optionsbackground);
			removeChild(bgmslider);
			removeChild(sfxslider);
			removeChild(backbutton);
			gamestatemanager.switchGamestate("Menu");
		}
		private function clickbgm(e:MouseEvent):void {
			if (bgmslider.currentFrame == 1) {
				bgmslider.gotoAndStop(2);
				gamestatemanager.bgm = false;
				gamestatemanager.musicmanager.changeVolume("bgm", gamestatemanager.bgm, gamestatemanager.sfx);
			}
			else {
				bgmslider.gotoAndStop(1);
				gamestatemanager.bgm = true;
				gamestatemanager.musicmanager.changeVolume("bgm", gamestatemanager.bgm, gamestatemanager.sfx);
			}
		}
		private function clicksfx(e:MouseEvent):void {
			if (sfxslider.currentFrame == 1) {
				sfxslider.gotoAndStop(2);
				gamestatemanager.sfx = false;
				gamestatemanager.musicmanager.changeVolume("sfx", gamestatemanager.bgm, gamestatemanager.sfx);
			}
			else {
				sfxslider.gotoAndStop(1);
				gamestatemanager.sfx = true;
				gamestatemanager.musicmanager.changeVolume("sfx", gamestatemanager.bgm, gamestatemanager.sfx);
			}
		}
	}

}