
import parcelas.*
import inta.*

class Plantas {	
	var property anioDeObtencion  
	var property altura
	var property esFuerte = self.horasDeSolToleradas() >= 10
	
	
	method daSemillas() = self.esFuerte() or self.condicionAlternativa()
	method espacioQueOcupa()
	method horasDeSolToleradas()
	method condicionAlternativa()
	method parcelaEsIdeal(parametro) 
		
	
}


class Menta inherits Plantas {
	
	override method horasDeSolToleradas() = 6
	
	override method espacioQueOcupa() = altura * 3 
	
	override method condicionAlternativa() = altura > 0.4
		
	override method parcelaEsIdeal(parcela) = parcela.superficie() > 6 
	
}

class Soja inherits Plantas {
	
	override method horasDeSolToleradas() = if (altura < 0.5) {6} else if (altura.between(0.5 , 1)) {7} else {9}
	
	override method condicionAlternativa() = anioDeObtencion >= 2007 and altura > 1
	
	override method espacioQueOcupa() = altura / 2
	
	override method parcelaEsIdeal(parcela) = parcela.horasDeSolRecibidas() == self.horasDeSolToleradas()
		
	
}

class Quinoa inherits Plantas {
	
	var property horasDeSolToleradasPorQuinoa 
	
	override method horasDeSolToleradas() = horasDeSolToleradasPorQuinoa
	
	method horasDeSolToleradas(cantidad) {horasDeSolToleradasPorQuinoa = cantidad}
	
	override method espacioQueOcupa() = 0.5
	
	override method condicionAlternativa() = anioDeObtencion <= 2005
	
	override method parcelaEsIdeal(parcela) = parcela.plantas().any({a =>a.altura() >= 1.5})
}

class SojaTransgenica inherits Soja{ 
	
	override method daSemillas() = false
	
	override method parcelaEsIdeal(parcela) = parcela.plantas().size() == 1
	
}

class Hierbabuena inherits Menta {
	
	override method espacioQueOcupa() = super() * 2
}