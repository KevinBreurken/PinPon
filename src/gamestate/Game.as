package gamestate 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import objects.Ball;
	import objects.PlayerPanel;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Game extends MovieClip
	{
		private var gamestatemanager:GamestateManager;
		private var ball:Ball = new Ball();
		
		private var playerone:PlayerPanel;
		private var playertwo:PlayerPanel;
		
		private var background:GameBackground = new GameBackground;
		private var whirlpool:WhirlPool = new WhirlPool;
		private var scoreboard:ScoreBoard = new ScoreBoard;
		public function Game(manager:GamestateManager) 
		{
			gamestatemanager = manager;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			playerone = new PlayerPanel(1);
			playertwo = new PlayerPanel(2);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild(background);
			addChild(scoreboard);
			addChild(whirlpool);
			whirlpool.x = Globals.origin.x;
			whirlpool.y = Globals.origin.y;
			addChild(ball);
			ball.x = Globals.origin.x;
			ball.y = Globals.origin.y;
			ball.isball = true;
			addChild(playertwo);
			addChild(playerone);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			
			if (playerone.hitbox.hitTestObject(ball.mc)) {
				ball.speed = -ball.speed;
				ball.updown = true;
			}
			
			if (playertwo.hitbox.hitTestObject(ball.mc)) {
				ball.speed = -ball.speed;
				ball.updown = true;
			}
			
		}
		
	}

}