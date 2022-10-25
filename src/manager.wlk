import wollok.game.*
import ball.*
import pad.*
import brick.*

object gameManager {

	
	
	const property alienListA = []
	var property alienOfset = 3
	
	method collisionAliensWith(aBall){
		if(!alienListA.isEmpty()){
			alienListA.forEach({ alien => if(alien.CanCollideWith(aBall)){
												aBall.invertDirectionY()
												alien.erase()
												alienListA.remove(alien)}			
							  })
		} 
		
	}	
	
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
	method CollisionWidth() = !alienListA.isEmpty() && (alienListA.first().position().x() < 1 
						   							 || alienListA.last().position().x() > game.width() - alienOfset)
	
	
	
	
	
}
