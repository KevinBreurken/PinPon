package gamestate {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import objects.Ball;
	import objects.PlayerPanel;

	public class Game extends MovieClip {
	
		[Embed(source="../../lib/narkisim.ttf",
		fontName = "myFont", 
		mimeType = "application/x-font", 
		fontWeight="normal", 
		fontStyle="normal", 
		advancedAntiAliasing="true", 
		embedAsCFF="false")]
		
		private var myEmbeddedFont : Class;
		private var textformat : TextFormat = new TextFormat( "myFont", 70 );
		
		private var gamestatemanager : GamestateManager;
		private var ball : Ball = new Ball();
		
		private var playerone : PlayerPanel;
		private var playertwo : PlayerPanel;
		
		private var background : GameBackground = new GameBackground;
		private var whirlpool : WhirlPool = new WhirlPool;
		private var scoreboard : ScoreBoard = new ScoreBoard;
		
		private var blackscore : int;
		private var blackscoretext : TextField = new TextField();
		private var whitescore : int;
		private var whitescoretext : TextField = new TextField();
		
		private var backbutton : BackButton = new BackButton();
		
		public function Game ( manager : GamestateManager) {
		
			gamestatemanager = manager;
		
			if (stage){
			
				init();
				
			} else {
			
				addEventListener(Event.ADDED_TO_STAGE, init);
			
			}
			
		}
		
		private function init ( e : Event = null ) : void {
		
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(background);
			addChild(scoreboard);
			
			addChild(whirlpool);
			whirlpool.x = Globals.origin.x;
			whirlpool.y = Globals.origin.y;
			
			addChild(ball);
			ball.x = Globals.origin.x;
			ball.y = Globals.origin.y;
			ball.isball = true;
			
			playerone = new PlayerPanel(1);
			playertwo = new PlayerPanel(2);
			addChild(playertwo);
			addChild(playerone);
			
			addChild(whitescoretext);
			addChild(blackscoretext);
			whitescoretext.x = 55;
			whitescoretext.y = 50;
			blackscoretext.x = 245;
			blackscoretext.y = 55;
			
			whitescoretext.defaultTextFormat = textformat;
			whitescoretext.embedFonts = true;
			
			blackscoretext.defaultTextFormat = textformat;
			blackscoretext.embedFonts = true;
			
			var hex : int = parseInt("FFFFFF", 16);
			whitescoretext.textColor = hex;
			
			addChild(backbutton);
			backbutton.x = 0;
			backbutton.y = -10;
			backbutton.addEventListener(MouseEvent.CLICK, toMenu);
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		
		private function toMenu ( e : MouseEvent ) : void {
		
			gamestatemanager.musicmanager.playSound("Gong");
			
			backbutton.removeEventListener(MouseEvent.CLICK, toMenu);
			removeEventListener(Event.ENTER_FRAME, update);
			removeChild(backbutton);
			removeChild(background);
			removeChild(playerone);
			removeChild(playertwo);
			removeChild(whirlpool);
			removeChild(ball);
			removeChild(blackscoretext);
			removeChild(whitescoretext);
			removeChild(scoreboard);
			gamestatemanager.switchGamestate("Menu");
			
		}
		
		private function update ( e : Event ) : void {
		
			if (gamestatemanager.endless) {
				
			} else {
			
				if (whitescore == gamestatemanager.pointstillwin || blackscore == gamestatemanager.pointstillwin) {
				
					toMenu(null);
					
				}
				
			}
			
			whitescoretext.text = "" + whitescore;
			blackscoretext.text = "" + blackscore;
			
			if (ball.distance >= 300) {
			
				gamestatemanager.musicmanager.playSound("Blub");
				
				switch(ball.lasthitted) {
				
				case 1:
					whitescore++;
				break;
				
				case 2:
					blackscore++;
				break;
				
				}
				
				newBall();
				
			}
			
			if (playerone.hitbox.hitTestPoint(ball.x,ball.y,true)) {
			
				ball.speed = -ball.speed;
				ball.updown = true;
				ball.lasthitted = 1;
				
			}
			
			if (playertwo.hitbox.hitTestPoint(ball.x,ball.y,true)) {
			
				ball.speed = -ball.speed;
				ball.updown = true;
				ball.lasthitted = 2;
				
			}
			
		}
		
		private function newBall () : void {
		
			removeChild(ball);
			ball.removeEventListener(Event.ENTER_FRAME, update);
			addChild(ball);
			ball.lasthitted = 0;
			ball.x = Globals.origin.x;
			ball.y = Globals.origin.y;
			ball.isball = true;
			ball.radius = 0;
			
		}
		
	}

}