class Ciudad {
	var property provincia
	
}


class Provincia {
	const property poblacion = 0
	const ciudades = #{}
	
	method tiene(ciudad){
		return ciudades.contains(ciudad)
	}
}

