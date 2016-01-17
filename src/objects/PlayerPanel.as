package objects {

	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.events.KeyboardEvent;
	import utils.movement.staticOrbit;

	public class PlayerPanel extends staticOrbit {
	
		private var player : int;
		public var mc : MovieClip;
		public var hitbox : HitBox;
		private var movement : int;
		
		private var up : Boolean;
		private var down : Boolean;
		
		public function PlayerPanel ( playernumber : int ) {
		
			player = playernumber;
			hitbox = new HitBox();
			
			switch(player) {
			
				case 1:
				
					mc = new PlayerPanelArt01();
					angle = 180;
					
				break;
				
				case 2:
				
					mc = new PlayerPanelArt02();
					angle = 360;
					
				break;
				
			}
			
			addChild(mc);
			addChild(hitbox);
			hitbox.x = -10;
			hitbox.visible = false;
			mc.x = -10;
			
			addEventListener(Event.ADDED_TO_STAGE, stageHandler);
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		
		public function stageHandler ( e : Event ) : void {
		
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			
		}
		
		public function update ( e : Event ) : void {
		
			movement = 0;
			
			if (up) {
			
				movement = 5;
				mc.rotation = 180;
				
			}
			
			if (down) {
			
				movement = -5;
				mc.rotation = 0;
				
			}
			
			Update(300, movement);
			
		}
		
		public function keyDown ( e : KeyboardEvent ) : void {
		
			if(player == 1){ // For player one
			
				if (e.keyCode == 87) {
				
					down = true;
					
				}
				if (e.keyCode == 83) {
				
					up = true;
					
				}
				
			} else { //For player two
			
				if (e.keyCode == 38) {
				
					down = true;
					
				}
				
				if (e.keyCode == 40) {  
				
					up = true;
					
				}	
			
			}
			
		}
		
		public function keyUp ( e : KeyboardEvent ) : void {
		
			if(player == 1){
			
				if (e.keyCode == 87) {
				
					down = false;
					
				}
				
				if (e.keyCode == 83) {
				
					up = false;
					
				}
			
			} else {
			
				if (e.keyCode == 38) {
				
				down = false;
				
				}
				
				if (e.keyCode == 40) {
				
					up = false;
					
				}
				
			}
			
		}
		
	}

}