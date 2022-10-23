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

class Alien {
	
	var property position 
	var property frame = 1
	var property image = "invaderA" + frame + ".png"
	var property direction = 1
	
	method draw() {
		game.addVisual(self)
	}
	
	method erase() {
		game.removeVisual(self)
	}
	
	method moveHorizontal(){
		position = new Position(x = position.x() + direction, y = position.y())
	}
	
	method moveLeft(){
		if(position.x() > 0)
		position = new Position(x = position.x() - 1, y = position.y())
	}
	
	method moveRight(){
		if(position.x() < game.width() - 1 )
		position = new Position(x = position.x() + 1, y = position.y())
	}
	
	method moveDown(){
		if(position.y() > 0 )
		position = new Position(x = position.x(), y = position.y() - 1)
	}
	
	method changeFrame(){
		if(frame == 1) frame++ else frame--
		image = "invaderA" + frame + ".png"
	}
	
	method changeDirection(){
		if(direction == 1) direction = -1 else direction = 1
	}
}