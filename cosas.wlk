object electrodomestico {
	
}

object mueble {
	
}

object comida {
	
}

//########################################### COSAS ###########################################

object heladera {
	method precio() = 20000
	method categoria() = electrodomestico
	method esUnaComida() = false
}

object cama {
	method precio() = 8000
	method categoria() = mueble
	method esUnaComida() = false
}

object tiraDeAsado {
	method precio() = 350
	method categoria() = comida
	method esUnaComida() = true
}

object paqueteDeFideos {
	method precio() = 50
	method categoria() = comida
	method esUnaComida() = true
}

object plancha {
	method precio() = 1200
	method categoria() = electrodomestico
	method esUnaComida() = false
}