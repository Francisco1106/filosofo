import Filosofo.*
class Actividad {
	method realizarActividad(filosofo)
}

object tomarVino inherits Actividad{
	
	override method realizarActividad(filosofo){
		filosofo.disminuirIluminacion(10)
		filosofo.agregarHonorifico("el borracho")
	}
}

class JuntarseEnElAgora  inherits Actividad{
	const filosofoConElQueEeJunta
	override method realizarActividad(unFilosofo){
		unFilosofo.juntarseConUnFilosofo(filosofoConElQueEeJunta)
	}
}

object admirarElPaisaje inherits Actividad{
	override method realizarActividad(unFilosofo){}
	
}

class MeditarBajoUnaCascada inherits Actividad{
	const tamanio
	override method realizarActividad(unFilosofo){
		unFilosofo.agregarIluminacion(tamanio*10)
	}
}
class PracticarUnDeporte inherits Actividad{
	var property diasQueRejuvenece
	override method realizarActividad(unFilosofo){
		unFilosofo.rejuvenecer(diasQueRejuvenece)
	}
}
object futbol inherits PracticarUnDeporte(diasQueRejuvenece = 1){}
object polo inherits PracticarUnDeporte(diasQueRejuvenece = 2){}
object waterpolo inherits PracticarUnDeporte(diasQueRejuvenece = polo.diasQueRejuvenece()*2){}




