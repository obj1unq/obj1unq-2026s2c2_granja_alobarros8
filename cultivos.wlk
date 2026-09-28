import wollok.game.*
import granja.*

object maiz {
   var property position = game.at(0, 0)
   var esBebe = true method esBebe() = esBebe
   method esBebe(valor) { esBebe = valor }
   method image() { return if (esBebe){ "maiz_bebe.png"} 
   else {"maiz_adulto.png"}
   } 
   } 
object trigo { 
   var property position = game.at(0, 0) 
   var etapa = 0 method etapa() = etapa 
   method etapa(valor) { etapa = valor } 
   method image() { return "trigo_" + etapa.toString() + ".png" }
} 
object tomaco {
    var property position = game.at(0, 0)
     method image() = "tomaco.png" 
}