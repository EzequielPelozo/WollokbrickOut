import wollok.game.*

object verde { method image() { return "tile_verde.png" } }
object rojo { method image() { return "tile_rojo.png" } }
object violeta { method image() { return "tile_violeta.png" } }
object naranja { method image() { return "tile_naranja.png" } }
object azul { method image() { return "tile_azul.png" } }
object amarillo { method image() { return "tile_amarillo.png" } }
object celeste { method image() { return "tile_celeste.png" } }
object blanco { method image() { return "tile_gris_base.png" } }

// Tile generico
class PieceTile {
	var property color
	var property position
	var property image = color.image()
}

class Vector2 {
	var property x
	var property y
}

class Ball {
	
	var property velocity = 1
	var property direction = new Vector2(x=1.5, y=1)  // 45 grados
	var property relativeX = 0						//origen de la pieza en el mapa X
	var property relativeY = 0						//origen de la pieza en el mapa Y
	var property tile = new PieceTile(color=verde, position= new Position(x=8, y=4))
	
	method movement() {
		tile.position(new Position(x = tile.position().x() + (direction.x() * velocity), 
								   y = tile.position().y() + (direction.y() * velocity)
		))
	}
	
	method drawBall() {
		game.addVisual(tile)
	}
	
	method CollisionWidthAndHeight() {
		if(tile.position().x() <= 0 || tile.position().x() >= game.width() - 1) direction.x(direction.x() * -1) 
		if(tile.position().y() <= 0 || tile.position().y() >= game.height() - 1) direction.y(direction.y() * -1) 
	}
	
	method collideWith(other) {
		if(other.collideWith(self)) {
			self.invertDirectionY()
		}
	}
	
	method invertDirectionY(){
		direction.y(direction.y() * -1)
	}
	
}