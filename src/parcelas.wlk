import plantas.*

import inta.*

class Parcelas {
	
	var property largo
	var property ancho
	var property horasDeSolRecibidas
	const property plantas = []
	
	method tipoDeParcela()
	
	method superficie() = largo * ancho 
	method plantasToleradas() = if (ancho > largo) {self.superficie() / 5} else {self.superficie() / 3 + largo}
	method tieneComplicaciones() = plantas.any({a => a.horasDeSolToleradas() < horasDeSolRecibidas })
	
	method plantar(planta) {
	 return if ((self.plantasToleradas() > plantas.size()) and planta.horasDeSolToleradas() + 2 >= horasDeSolRecibidas) {plantas.add(planta)}
		    else {self.error("no se puede plantar")}		
	}
	
	method _seAsociaBien(planta)
}



class ParcelaEcologica inherits Parcelas {

 override method tipoDeParcela() = "ecologica"
 override method _seAsociaBien(planta) = not self.tieneComplicaciones() and  planta.parcelaEsIdeal(self)
 
 
 }

class ParcelaIndustrial inherits Parcelas {

override method tipoDeParcela() = "industrial"
override method _seAsociaBien(planta) = self.plantas().size() <= 2 and planta.esFuerte()
}