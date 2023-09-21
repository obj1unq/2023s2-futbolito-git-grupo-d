import wollok.game.*

object lionel {

	var property position = game.at(3, 5)
	var pelotaDeLio = pelota

	method image() {
		return "lionel-titular.png"
	}

	method irALaPelota() {
		position = pelotaDeLio.position()
	}

	method validarPosition() {
		if (position != pelotaDeLio.position()) {
			self.error("No estoy donde puedo hacerlo")
		}
	}

	method llevar() {
		self.validarPosition()
		pelotaDeLio.serLlevada(self)
	}
	
	method mover(nuevaPosicion){
		position = nuevaPosicion
		pelotaDeLio.mover(nuevaPosicion)
	}

}

object pelota {

	const property image = "pelota.png"
	var property position = game.at(5, 5)
	var estado = libre

	method mover(_position) {
		estado.mover(_position,self)
	}

	method serLlevada(_jugador) {
		llevada.jugador(_jugador)
		estado = llevada
	}

	method dejarLlevada() {
		estado = libre
	}

	method position() {
		return estado.position()
	}

	method esquina() {
		position = game.at(0, 0)
	}

}

object llevada {

	var property jugador = null

	method position() {
		return jugador.position()
	}

	method mover(_position,pelota) {
		pelota.position(_position)
	}

}

object libre {

	method mover(_position, pelota){}
}

