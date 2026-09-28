import wollok.game.*
import granja.*

object maiz {
   var property position = game.at(0, 0)
   var esBebe = true 
   method esBebe() = esBebe
   method esBebe(valor) { esBebe = valor }
   method image() { return if (esBebe){ "maiz_bebe.png"} 
   else {"maiz_adulto.png"}
   }
   method regar() { esBebe = false } 
} 
object trigo { 
   var property position = game.at(0, 0) 
   var etapa = 0 
   method etapa() = etapa 
   method etapa(valor) { etapa = valor } 
   method image() { return "trigo_" + etapa.toString() + ".png" }
   method regar() { etapa = if (etapa < 3) etapa + 1 else 0 }
} 
object tomaco {
   var property position = game.at(0, 0)
   method image() = "tomaco.png" 
   method regar() { 
      const proximoY = if (position.y() == game.height() - 1) {0} 
      else {position.y() + 1 }
      const proximaPosicion = game.at(position.x(), proximoY) if (not granja.hayCultivo(proximaPosicion)) { position = proximaPosicion }
   }
}