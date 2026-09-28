import wollok.game.*




object mercado {
	const property position = game.at(5,5)
	const property image = "mercado.png"
}

object granja {
	const property cultivos = #{}
	method plantar(cultivo, position) {
		self.validarPlantar(cultivo, position)
		cultivo.position(position)
		cultivos.add(cultivo)
		game.addVisual(cultivo)
	}
	method validarPlantar(cultivo, position) {
		if (not self.puedePlantar(cultivo, position)) {
			self.error("No se puede plantar")
		}
	}
	method puedePlantar(cultivo, position) {
		return not cultivos.contains(cultivo) and not self.hayCultivo(position)
	}
	method hayCultivo(position) {
		return cultivos.any({cultivo => cultivo.position() == position})
	}

	method regar(posicion) {
		if (not self.hayCultivo(posicion)) {
			 self.error("no tengo nada para regar") 
			 } 
		const cultivo = cultivos.find({ cultivo => cultivo.position() == posicion }) cultivo.regar() }
}