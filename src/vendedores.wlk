import certificaciones.*
import ciudades.*

class Vendedor {

	method agregar(certificacion){
		self.certificaciones().add(certificacion)
	}

	method certificaciones()

	method esVersatil(){
		return self.certificaciones().size() >= 3 and self.tieneAlgunaCertificacionDeProductos() and self.tieneAlgunaCertificacionQueNoEsDeProductos()
	}
	
	method tieneAlgunaCertificacionDeProductos(){
		return self.certificaciones().any {certificacion => certificacion.esSobreProductos()} 
	}
	
	method tieneAlgunaCertificacionQueNoEsDeProductos(){
		return self.certificaciones().any {certificacion => not certificacion.esSobreProductos()}
	}
	
	method esFirme(){
		return  self.puntajeTotalDeCertificaciones() >= 30
	}
	
	method puntajeTotalDeCertificaciones(){
		return self.certificaciones().sum {certificacion => certificacion.puntosQueOtorga()}
	}
	
	method puedeTrabajarEn(ciudad)
	
	method tieneAfinidadCon(centro){
		return self.puedeTrabajarEn(centro.ciudad())
	}
	
	method esCandidato(centro){
		return self.esVersatil() and self.tieneAfinidadCon(centro)
	}
	
	method cantCertificacionesSobreProductos(){
		return self.certificaciones().count {certificacion => certificacion.esSobreProductos()}
	}
	
	method personaFisica(){
		return true
	}
	
}

class VendedorFijo inherits Vendedor {
	var ciudad
	var certificaciones = #{}
	
	override method certificaciones(){
		return certificaciones
	}
	
	override method puedeTrabajarEn(ciudad_){
		return ciudad == ciudad_
	}
	
	method esInfluyente(){
		return false
	}
}


class VendedorViajante inherits Vendedor{
	const provinciasHabilitadoATrabajar = #{}
	var certificaciones = #{}

	override method certificaciones(){
		return certificaciones
	}

	
	override method puedeTrabajarEn(ciudad_){
		return provinciasHabilitadoATrabajar.any {provincia => provincia.tiene(ciudad_)}
	}
	
	method esInfluyente(){
		return self.poblacionDeTodasLasProvinciasHabilitadoATrabajar() >= 10000000
	}
	
	method poblacionDeTodasLasProvinciasHabilitadoATrabajar(){
		return provinciasHabilitadoATrabajar.sum {provincia => provincia.poblacion()}
	}
}


class ComercioCorresponsal inherits Vendedor{
	const ciudadesEnLasQueTieneSucursales = #{}
	var certificaciones = #{}

	override method certificaciones(){
		return certificaciones
	}
	
	override method puedeTrabajarEn(ciudad_){
		ciudadesEnLasQueTieneSucursales.constains(ciudad_)
	}
	
	method esInfluyente(){
		return ciudadesEnLasQueTieneSucursales.size() >= 5 or self.provinciasEnLasQueTieneSucursales() >= 3
	}
	
	method provinciasEnLasQueTieneSucursales(){
		return ciudadesEnLasQueTieneSucursales.map {ciudad => ciudad.provincia()}.asSet()
	}
	
	override method tieneAfinidadCon(centro){
		return super(centro) and self.hayCiudadQueNoPuedeCubrir(centro)
	}
	
	method hayCiudadQueNoPuedeCubrir(centro){
		return ciudadesEnLasQueTieneSucursales.any {ciudad => not centro.puedeCubrir(ciudad)}
	}
	
	override method personaFisica(){
		return false
	}
	
}





