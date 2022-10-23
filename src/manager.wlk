import wollok.game.*
import ball.*
import pad.*
import brick.*

object gameManager {

	// crear lista de bricks
	const property brickList = []
	
	const property alienListA = []
	var property alienOfset = 3
	var property direction 
	
	
	//Alien game.width()/alienOfset - 1 
	method fillAlienListA(count){
		(0..count - 1).forEach({
			index => alienListA.add(new Alien(position=new Position(x=index*alienOfset, y=20)))
		})
	}
	
	method drawAlienListA(){
		alienListA.forEach({
			alien => alien.draw()
		})
	}
	
	method changeFrameAlien(){
		alienListA.forEach({
			alien => alien.changeFrame()
		})
	}
	
	method moveLeft(){
		alienListA.forEach({
			alien => alien.moveLeft()
		})
	}
	
	method moveRight(){
		alienListA.forEach({
			alien => alien.moveRight()
		})
	}
	
	method moveDown(){
		alienListA.forEach({
			alien => alien.moveDown()
		})
	}
	
	method moveHorizontal(){
		alienListA.forEach({
			alien => alien.moveHorizontal()
		})
	}
	
	method changeDirection() {
		alienListA.forEach({
			alien => alien.changeDirection()
		})
	}
	
	// Colisiona lista de aliens con bordes
	method CollisionWidth() = alienListA.first().position().x() < 1 
						   || alienListA.last().position().x() > game.width() - alienOfset
	
	
	
	
	//llenar ladrillos
	method fillBrickList() {
		(0..game.width() - 1).forEach({
			index => brickList.add(new Brick(tile = new PieceTile(color = naranja, position = new Position(x = index, y = 20))))
		})
		//brickList.add(new Brick(tile = new PieceTile(color = naranja, position = new Position(x = 4, y = 20))))
	}
	// dibujar bricks
	method drawBrickList() {
			brickList.forEach({
			brick => brick.drawBrick()
		})
	}	
	
}
