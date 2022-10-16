import ball.*
import wollok.game.*
object pad {
		
	const property tilesMap = []			//mapa de tiles de la pieza
	var property padLength = 4				//tamaño de lado del pad
	var property origin = new Vector2(x=5, y=1)
	// Llenar el tileMap
	method fillTileMap() {
		(1..padLength).forEach({
			index => tilesMap.add(new PieceTile(color = azul, 
												position = new Position(x=origin.x()+index, y=origin.y())
			))
		})
	}
	// Dibujar el Pad
	method drawPad() {
		tilesMap.forEach({
			tile => game.addVisual(tile)
		})
	}	
	// Mover izquierda
	method MoveLeft() {
		tilesMap.forEach({		
			t => t.position(new Position(x = t.position().x() - 1, 
										 y = t.position().y() 
			))
		})
	}
	// Mover derecha
	method MoveRight() {
		tilesMap.forEach({		
			t => t.position(new Position(x = t.position().x() + 1, 
										 y = t.position().y() 
			))
		})
	}
	// Colisiona con la bola bool
	method collideWith(ball) = tilesMap.any({
		tile => tile.position().x() == ball.tile().position().x() 
			 && tile.position().y() + 1 == ball.tile().position().y()
	})
	// Colisiona con bordes
	method CollisionWidth() = tilesMap.first().position().x() < 0 
						   || tilesMap.last().position().x() > game.width() - 1  
	
	
	
}
