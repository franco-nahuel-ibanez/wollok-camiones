object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteLadrillos{
	var cantidad
	
	method setCantidad(cant){ cantidad = cant }
	method peso(){return 2*cantidad}
	method nivelPeligrosidad(){return 2}
}

object arenaAGranel{
	var peso = 0
	
	method setPeso(nuevoPeso){ peso += nuevoPeso }
	method peso(){return peso}
	method nivelPeligrosidad(){return 1}
}


object bateriaAntiaerea{
	var tieneMisiles = false
	
	method peso(){ return if(tieneMisiles) 300 else 200 }
	method nivelPeligrosidad(){ return if(tieneMisiles) 100 else 0 }
	method setMisiles() {tieneMisiles = not tieneMisiles }
}

object contenedorPortuario{
	const cosasDentro = []
	
	method meterAlgo(cosa){ cosasDentro.add(cosa) }
	method peso(){ return cosasDentro.sum({ c => c.peso() }) + 100 }
	method nivelPeligrosidad(){
		var resultado = 0
		if(cosasDentro.size() > 0 ){
			resultado = cosasDentro.max({c => c.nivelPeligrosidad()}).nivelPeligrosidad()
		}
		return resultado
	}
}

object residuos{
	var peso = 0
	
	method setPeso(nuevoPeso){peso += nuevoPeso}
	method peso(){return peso}
	method nivelPeligrosidad(){return 200}
}

object embalaje{
	var objetoEnvuelto
	
	method envolver(objeto){ objetoEnvuelto = objeto }
	method peso(){ return objetoEnvuelto.peso() }
	method nivelPeligrosidad(){return objetoEnvuelto.nivelPeligrosidad() / 2}
}

























