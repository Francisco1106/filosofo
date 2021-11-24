import Filosofo.*
object discusion {
	var property partidos = []
	
	method discusionEsBuena(){
		return partidos.all{partido => partido.conUnCincuentaPorcientoDeBuenosArgumentos() && partido.filosofoEnLoCorrecto()}
	}
	method agregarPartido(partido){
		partidos.add(partido)
	}
}

class Partido{
	const filosofo
	const argumentos = []
	
	method conUnCincuentaPorcientoDeBuenosArgumentos(){
		const argumentosEnriquecedores = argumentos.filter{argumento => argumento.argumentoEnriquecedor()}
		const porsentaje = argumentosEnriquecedores.size()*100/argumentos.size()
		return porsentaje >= 50
	}
	method filosofoEnLoCorrecto(){
		return filosofo.estaEnLoCorrecto()
	}
}

class Argumento{
	const descripcion
	const naturalezas = []
	
	method tieneAlMenos10Palabras(){
		return descripcion.words().size() >= 10
	}
	
	method terminaConDuda(){
		return descripcion.words().last() == "?"
	}
	
	method argumentoEnriquecedor(){
		return naturalezas.all{naturaleza =>naturaleza.enriquecenlaDiscucion(self)}
	}
	
}

class Naturalezas{
	method enriquecenlaDiscucion(argumento)
}

object estoicos inherits Naturalezas{
	override method enriquecenlaDiscucion(argumento){
		return true
	}
}

object moralistas inherits Naturalezas{
	override method enriquecenlaDiscucion(argumento){
		return argumento.tieneAlMenos10Palabras()
	}
}

object esceptica inherits Naturalezas{
	override method enriquecenlaDiscucion(argumento){
		return argumento.terminaConDuda()
	}
}

object cinica inherits Naturalezas{
	override method enriquecenlaDiscucion(argumento){
		return 1.randomUpTo(30) == 30 
	}
}
