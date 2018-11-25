
class CentroDeDistribucion {
	var property ciudad
	const vendedoresConQueTrabaja = #{}
	
	method agregar(vendedor){
		if(not vendedoresConQueTrabaja.contains(vendedor)){
			vendedoresConQueTrabaja.add(vendedor)
		}
		else{
			self.error("no se puede registrar un vendedor que ya esta registrado")
		}
	}
	
	method vendedorEstrella(){
		return vendedoresConQueTrabaja.max {vendedor => vendedor.puntajeTotalDeCertificaciones()}
	}
	
	method puedeCubrir(ciudad_){
		return vendedoresConQueTrabaja.any {vendedor => vendedor.puedeTrabajarEn(ciudad_)}
	}
	
	method vendedoresGenericos(){
		return vendedoresConQueTrabaja.filter {vendedor => vendedor.tieneAlgunaCertificacionQueNoEsDeProductos()}
	}
	
	method esRobusto(){
		return self.cantVendedoresFirmes() >= 3
	}
	
	method cantVendedoresFirmes(){
		return vendedoresConQueTrabaja.count {vendedor => vendedor.esFirme()}
	}
	
	method repartir(certificacion){
		vendedoresConQueTrabaja.forEach {vendedor => vendedor.agregar(certificacion)}
	}
}

