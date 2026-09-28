
import wollok.game.*
import granja.*
import cultivos.*
object personaje {
  var property position = game.at(5, 5)
  var esFemenino = true

  method esFemenino() = esFemenino

  method cambiarGenero() {
    esFemenino = not esFemenino
  }

  method estaSobreElemento() {
    return granja.hayCultivo(position) or not game.colliders(self).isEmpty()
  }

  method prefijoGenero() {
    return if (esFemenino) "f-player" else "m-player"
  }

  method sufijoOrientacion() {
    return if (self.estaSobreElemento()) "abajo" else "normal"
  }

  method image() {
    return self.prefijoGenero() + "-" + self.sufijoOrientacion() + ".png"
  }

  // === ACCIONES DE SIEMBRA ===

  method sembrarMaiz() {
    granja.plantar(maiz, position)
  }

  method sembrarTrigo() {
    granja.plantar(trigo, position)
  }

  method sembrarTomaco() {
    granja.plantar(tomaco, position)
  }
}
