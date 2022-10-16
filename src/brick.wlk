import ball.*
import wollok.game.*

class Brick {
	
	var property tile = new PieceTile(color = naranja, position = new Position(x = 0, y = 0))	
	
	method drawBrick() {
		game.addVisual(tile)
	}
	
	// Colisiona con la bola bool
	method collideWith(ball) =  tile.position().x() == ball.tile().position().x() 
							 && tile.position().y() == ball.tile().position().y()
	// Borra el ladrillo y rebota la bola
	method eraseBrick(ball) {
		if(self.collideWith(ball)){
			game.removeVisual(tile)
			ball.invertDirectionY()			
		}	
	}
}