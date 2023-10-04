import wollok.game.*

object lionel {

	var property position = game.at(3, 5)
	var property pelotaDeLio = pelota
	var property llevando = estadoLibre
	var property camiseta = camisetaTitular

	method position(_position) {
		position = _position
		llevando.moverPelota(self)
	}

	method image() {
		return "lionel-titular.png"
	}

	method irALaPelota() {
		position = pelotaDeLio.position()
	}

	method llevarLaPelota() {
		self.validarTieneLaPelota()
		llevando.cambiarEstado(self)
	}

	method validarTieneLaPelota() {
		if (position != pelotaDeLio.position()) {
			self.error("no tengo la pelota")
		}
	}

	method patear() {
		self.validarTieneLaPelota()
		llevando.patear(self)
	}

	method taquito() {
		self.validarTieneLaPelota()
		llevando.taquito(self)
	}

	method cambiarCamiseta() {
	}

}

object pelota {

	const property image = "pelota.png"
	var property position = game.at(5, 5)
	const distanciaPateado = 3
	const distanciaTaquito = 2

	method irAlOrigen() {
		position = game.at(0, 0)
	}

	method serPateada() {
		position = position.right(self.recorridoPosible(game.width() - 1, distanciaPateado))
	}

	method taquito() {
		position = position.left(self.recorridoPosible(0, distanciaTaquito))
	}

	method recorridoPosible(borde, recorrido) {
		return self.distanciaAlBorde(borde).min(recorrido)
	}

	method distanciaAlBorde(borde) {
		return (borde - self.position().x()).abs()
	}

}

object estadoLlevando {

	const cambioEstado = estadoLibre

	method moverPelota(jugador) {
		jugador.pelotaDeLio().position(jugador.position())
	}

	method cambiarEstado(jugador) {
		jugador.llevando(cambioEstado)
	}

	method patear(jugador) {
		self.cambiarEstado(jugador)
		jugador.pelotaDeLio().serPateada()
	}

	method taquito(jugador) {
		self.cambiarEstado(jugador)
		jugador.pelotaDeLio().taquito()
	}

}

object estadoLibre {

	const cambioEstado = estadoLlevando

	method moverPelota(juegador) {
	}

	method cambiarEstado(jugador) {
		jugador.llevando(cambioEstado)
	}

	method patear(jugador) {
		jugador.pelotaDeLio().serPateada()
	}

	method taquito(jugador) {
		jugador.pelotaDeLio().taquito()
	}

}

object camisetaTitular {


}

