import wollok.game.*
import ball.*
import pad.*
import brick.*

object gameManager {
	
	// crear lista de bricks
	const property brickList = []
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
