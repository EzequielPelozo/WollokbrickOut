import ball.*
import wollok.game.*

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
	
	method CanCollideWith(aBall) { return
		aBall.tile().position().x() == position.x() && aBall.tile().position().y() == position.y()
		|| aBall.tile().position().x() == position.x() && aBall.tile().position().y() == position.y() + 1
		|| aBall.tile().position().x() == position.x() + 1 && aBall.tile().position().y() == position.y()
		|| aBall.tile().position().x() == position.x() + 1 && aBall.tile().position().y() == position.y() + 1		
	}
}