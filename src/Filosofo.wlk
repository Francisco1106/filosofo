import Actividad.*
class Filosofo{
	const nombre
	var property anios
	var property diasVividos
	var property actividades = []
	var property honorificos = []
	var property nivelDeIluminacion
	
	method presentarse(){
		return nombre +" "+ honorificos.join(",")
	}
	
	method estaEnLoCorrecto(){
		return nivelDeIluminacion >= 1000
	}
	
	method disminuirIluminacion(valor){
		nivelDeIluminacion -= valor
	}
	
	method agregarHonorifico(honorifico){
		honorificos.add(honorifico)
		honorificos = honorificos.asSet()
	}
	
	method agregarIluminacion(valor){
		nivelDeIluminacion += valor
	}
	
	method rejuvenecer(dias){
		 if(diasVividos == 0){
		 anios -=1
		 diasVividos = 365 - dias
		 }else{
		 	diasVividos -= dias
		 }
	}
	
	method vivirUnDia(){
		actividades.forEach{actividad => actividad.realizarActividad(self)}
		diasVividos += 1
		if (self.cumpleAnios()){
			diasVividos = 0
			anios += 1
			self.agregarIluminacion(10)
			self.cumpleAnios60()
			}
	}
	method cumpleAnios(){
		return diasVividos >= 365
	}
	method cumpleAnios60(){
		if (anios > 60){
			self.agregarHonorifico("el sabio")
		}
	}
	method juntarseConUnFilosofo(filosofo){
		self.agregarIluminacion(filosofo.nivelDeIluminacion()/10)
	}
}
class Contemporaneo inherits Filosofo{
	override method presentarse(){
		return "hola"
	}
	method esAmanteDeLaBotanica(){
		 if(honorificos.any{honorifico => honorifico =="amante de la botánica"}){
		 	nivelDeIluminacion *= 5
		 }else{
		 	self.error("No es amante de la botanica") 
		 }
	}
}
