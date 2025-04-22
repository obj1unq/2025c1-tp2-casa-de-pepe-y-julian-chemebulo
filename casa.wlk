import cosas.*

object casaDePepeYJulian {
  const property cosasCompradas = []
  var property cuentaActual = cuentaCorriente
  
  //################################################################################

  method comprar(cosa) {
    cuentaActual.extraer(cosa.precio())
    cosasCompradas.add(cosa)
  }
  
  //################################################################################

  method cantidadDeCosasCompradas() = cosasCompradas.size()
  
  //################################################################################

  method tieneAlgun(categoria) = cosasCompradas.any(
    { cosa => cosa.categoria() == categoria }
  )
  
  //################################################################################

  method vieneDeComprar(
    categoria
  ) = self.compraronAlgo() && (cosasCompradas.last().categoria() == categoria)
  
  method compraronAlgo() = cosasCompradas.size() > 0
  
  //################################################################################

  method esDerrochona() = self.precioTotalDeCosasCompradas() >= 9000
  
  method precioTotalDeCosasCompradas() = cosasCompradas.sum({ cosa => cosa.precio() })
  
  //################################################################################ 

  method compraMasCara() = cosasCompradas.filter(
    { cosa => self.esCompraMasCara(cosa) }
  )
  
  method esCompraMasCara(cosa) = cosa.precio() == self.precioDeCompraMasCara()
  
  method precioDeCompraMasCara() = self.cosaMasCaraEnLaLista().precio()
  
  method cosaMasCaraEnLaLista() = if (self.compraronAlgo()) cosasCompradas.max(
                                       { cosa => cosa.precio() }
                                     )
                                   else 0

  //################################################################################

  method comprados(categoria) = cosasCompradas.filter(
    { cosa => cosa.categoria() == categoria }
  )
  
  //################################################################################

  method malaEpoca() = cosasCompradas.all({cosa => cosa.esUnaComida()}) 

  //################################################################################

  method queFaltaComprar(lista) = lista.filter(
    { cosa => not self.seCompro(cosa) }
  )
  
  method seCompro(cosa) = cosasCompradas.contains(cosa)
  
  //################################################################################

  method faltaComida() = self.cantidadDeComidaComprada() < 2
    
  method cantidadDeComidaComprada() = self.comprados(comida).size()
  
  //################################################################################

  method categoriasCompradas() = cosasCompradas.map(
    { cosa => cosa.categoria() }
  ).asSet()
}

object cuentaCorriente {
  var saldo = 20
  // Inicializado con 20, pero es posible modificarlo con "depositar(cantidad)".
  
  method saldo() = saldo
  
  method depositar(cantidad) {
    saldo += cantidad
  }
  
  method extraer(cantidad) {
    self.validarSiPuedeExtraer(cantidad)
    saldo -= cantidad
  }
  
  method validarSiPuedeExtraer(cantidad) {
    if (self.saldo() < cantidad) self.error(
        "No hay suficiente plata en la cuenta."
      )
  }
}

object cuentaConGastos {
  var property costoPorOperacion = 20
  var saldo = 500
  // Inicializado con 500, pero es posible modificarlo con "depositar(cantidad)", aunque no más de 1000 por depósito.
  
  method saldo() = saldo
  
  method depositar(cantidad) {
    self.validarSiPuedeDepositar(cantidad)
    saldo += cantidad - costoPorOperacion
  }
  
  method validarSiPuedeDepositar(cantidad) {
    if (cantidad > 1000) self.error(
        "No se puede depositar más de 1000 en un despósito."
      )
  }
  
  method extraer(cantidad) {
    saldo -= cantidad
  }
}