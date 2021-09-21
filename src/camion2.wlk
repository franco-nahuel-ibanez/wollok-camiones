
import cosas2.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) { 
		cosas.add(unaCosa)
		unaCosa.cargado()
	}
	
	method descargar(unaCosa){ cosas.remove(unaCosa) }

	method todoPesoPar(){ return cosas.all({ c => c.peso().even() }) }
	
	method hayAlgunoQuePesa(peso){ return cosas.any({ c => c.peso() == peso }) }
	
	method elDeNivel(nivel){ return cosas.find({ c => c.nivelPeligrosidad() == nivel }) }
	
	method pesoTotal(){ return cosas.sum({ c => c.peso() }) + 1000 }
	
	method excedidoDePeso(){ return self.pesoTotal() > 2500 }
	
	method objetosQueSuperanPeligrosidad(nivel){ return cosas.filter({ c => c.nivelPeligrosidad() > nivel }) }
	
	method objetosMasPeligrososQue(cosa){ return cosas.filter({ c => c.nivelPeligrosidad() > cosa.nivelPeligrosidad() }) }
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){ 
		return not(self.excedidoDePeso()) and not( cosas.any({c => c.nivelPeligrosidad() > nivelMaximoPeligrosidad })   )  
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({ c => c.peso().between(min, max) })
	}
	
	method cosaMasPesada(){return cosas.max({ c => c.peso() })}
	
	method pesos(){ return cosas.map({ c => c.peso() }) }
	
	method totalBultos(){ return cosas.sum({ c => c.bulto() }) }
}

