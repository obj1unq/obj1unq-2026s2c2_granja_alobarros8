import wollok.game.*




object mercado {
	const property position = game.at(5,5)
	const property image = "mercado.png"
}

object granja {
	const property cultivos = #{}
	const cosechados = []
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
	method validarRegar(posicionActual) {
		if ( not self.hayCultivo(posicionActual) ){
			self.error("No hay nada para regar")
		}
	}
	method cultivoEn(posicion) {
		 return cultivos.find({ cultivo => cultivo.position() == posicion }) 
	}
	method regar(posicion) {
		self.validarRegar(posicion)
		const cultivo = cultivos.find({ cultivo => cultivo.position() == posicion }) cultivo.regar() }
	
	method validarCosechar(posicion) { 
		if (not self.hayCultivo(posicion)) {
			 self.error("No hay nada para cosechar") 
			 } 
		const cultivo = self.cultivoEn(posicion) 
		if (not cultivo.estaListoParaCosechar()) { 
			self.error("El cultivo no está listo para cosechar") 
			} 
	} 
	method cosechar(posicion) { 
		self.validarCosechar(posicion) 
		const cultivo = self.cultivoEn(posicion) 
		cultivos.remove(cultivo) 
		cosechados.add(cultivo) 
		game.removeVisual(cultivo) 
		}

}