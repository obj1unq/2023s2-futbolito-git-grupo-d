/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}
	
	method validarPosition(algo) {
		if(position != algo.position()) {
			self.error("No estoy donde puedo hacerlo")
		}
	}
	method llevar(pelota) {
		self.validarPosition(pelota)
		pelota.serLlevada(self)
	}
	
}


object pelota {
	const property image="pelota.png"
	
	var estado = libre
	
	method position(_position) {
		estado.position(_position)
	}
	
	method serLlevada(_jugador) {
		llevada.jugador(_jugador)
		estado = llevada	
	}
	
	method dejarLlevada() {
		libre.position(self.position())
		estado = libre
	}
	
	method position() {
		return estado.position()
	}
	
}

object llevada {

	var property jugador = null
	
	method position() {
		return jugador.position()
	}
	
	method position(_position) {
		self.error("me estan llevando")
	}
		
}

object libre {
	
	var property position = game.at(5,5)


}