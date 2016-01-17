package {

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import gamestate.Game;
	import gamestate.GameStateManager;
	import gamestate.Menu;
	import utils.loaders.SoundPlayer;
	
	public class Main extends Sprite {
	
		public var gameStateManager : gameStateManager;
		private var frameMask : Shape = new Shape();
		private var soundplayer : SoundPlayer = new SoundPlayer;
		var bgshape : Sprite;
		var default_bg_color : uint = 0x000000;
		
		public function Main():void {
		
			if (stage){
			
				init();
				
			} else {
			
				addEventListener(Event.ADDED_TO_STAGE, init);
			
			}
			
		}
		
		private function init( e : Event = null ) : void {
		
			frameMask.graphics.beginFill(0x000000);
			frameMask.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			frameMask.graphics.endFill();
			addChild(frameMask);
			this.mask = frameMask;
			
			bgshape = new Sprite();
			bgshape.graphics.beginFill(default_bg_color);
			bgshape.graphics.drawRect(-1000,0,5000, 2000);
			addChildAt(bgshape, 0);
			
			gameStateManager = new gameStateManager(soundplayer);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(gameStateManager);
			gameStateManager.sfx = true;
			gameStateManager.bgm = true;
			gameStateManager.switchGamestate("Menu");
			
		}
		
	}
	
}