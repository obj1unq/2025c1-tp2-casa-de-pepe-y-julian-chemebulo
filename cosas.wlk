object electrodomestico {}

object mueble {}

object comida {}

//########################################### COSAS ###########################################

object heladera {
	method precio() = 20000
	method categoria() = electrodomestico
	method esDeCategoria(categoria){
		return self.categoria() == categoria
	}
}

object cama {
	method precio() = 8000
	method categoria() = mueble
	method esDeCategoria(categoria){
		return self.categoria() == categoria
	}
}

object tiraDeAsado {
	method precio() = 350
	method categoria() = comida
	method esDeCategoria(categoria){
		return self.categoria() == categoria
	}
}

object paqueteDeFideos {
	method precio() = 50
	method categoria() = comida
	method esDeCategoria(categoria){
		return self.categoria() == categoria
	}
}

object plancha {
	method precio() = 1200
	method categoria() = electrodomestico
	method esDeCategoria(categoria){
		return self.categoria() == categoria
	}
}