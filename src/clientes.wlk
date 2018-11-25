import vendedores.*



class Inseguro {
	
	method puedeSerAtendidoPor(vendedor){
		return vendedor.esVersatil() and vendedor.esFirme()
	}
	
}


class Detallista {
	
	method puedeSerAtendidoPor(vendedor){
		return vendedor.cantCertificacionesSobreProductos() >= 3
	}
	
}


class Humanista {
	
	method puedeSerAtendidoPor(vendedor){
		return vendedor.personaFisica()
	}

}