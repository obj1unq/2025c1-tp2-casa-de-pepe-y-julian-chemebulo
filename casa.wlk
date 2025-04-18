import cosas.* 

object casaDePepeYJulian {
    const property cosasCompradas = []
    var property cuentaActual = cuentaCorriente

    //################################################################################

    method cosasCompradas() {
        return cosasCompradas
    }

    method comprar(cosa){
        cosasCompradas.add(cosa)
        cuentaActual.extraer(cosa.precio())
    }

    //################################################################################

    method cantidadDeCosasCompradas(){
        return cosasCompradas.size()
    }

    //################################################################################

    method tieneAlgun(categoria){
        return cosasCompradas.any({cosa => cosa.categoria() == categoria})
    }

    //################################################################################

    method vieneDeComprar(categoria){
        return self.compraronAlgo() && cosasCompradas.last().categoria() == categoria
    }

    method compraronAlgo() {
        return cosasCompradas.size() > 0
    }

    //################################################################################

    method esDerrochona(){
        return self.totalDeCosasCompradas() >= 9000
    }

    method totalDeCosasCompradas() {
        return cosasCompradas.sum({cosa => cosa.precio()})
    }

    //################################################################################ 

    method compraMasCara(){
        return cosasCompradas.filter({cosa => self.esCompraMasCara(cosa)})
    }

    method esCompraMasCara(cosa) {
        return cosa.precio() == self.precioDeCompraMasCara()
    }

    method precioDeCompraMasCara() {
        return if(self.compraronAlgo()) {
                    cosasCompradas.max({cosa => cosa.precio()})
               } else 0
    }

    //################################################################################

    method comprados(categoria){
        return cosasCompradas.filter({cosa => cosa.categoria() == categoria})
    }

    //################################################################################

    method malaEpoca(){
        return self.cantidadDeComidaComprada() == cosasCompradas.size()
    }

    //################################################################################

    method queFaltaComprar(lista){
        return lista.filter({cosa => not self.seCompro(cosa)})
    }

    method seCompro(cosa) {
        return cosasCompradas.contains(cosa)
    }

    //################################################################################

    method faltaComida(){
        return self.cantidadDeComidaComprada() < 2
    }

    method cantidadDeComidaComprada() {
        return self.comprados(comida).size()
    }

    //################################################################################

    method categoriasCompradas(){
        return cosasCompradas.map({cosa => cosa.categoria()}).asSet()
    }
}


object cuentaCorriente {

    var saldo = 20 // Inicializado con 20, pero es posible modificarlo con "depositar(cantidad)".

    method saldo() {
        return saldo
    }

    method depositar(cantidad) {
        saldo += cantidad
    }

    method extraer(cantidad) {
        self.validarSiPuedeExtraer(cantidad)
        saldo -= cantidad
    }

    method validarSiPuedeExtraer(cantidad) {
        if (self.saldo() < cantidad) {
            self.error("No hay suficiente plata en la cuenta.")
        }
    }
}

object cuentaConGastos {

    var property costoPorOperacion = 20
    var saldo = 500 // Inicializado con 500, pero es posible modificarlo con "depositar(cantidad)", aunque no más de 1000 por depósito.

    method saldo() {
        return saldo
    }

    method depositar(cantidad) {
        self.validarSiPuedeDepositar(cantidad)
        saldo += cantidad - costoPorOperacion
    }

    method validarSiPuedeDepositar(cantidad) {
        if (cantidad > 1000) {
            self.error("No se puede depositar más de 1000 en un despósito.")
        }
    }

    method extraer(cantidad) {
        saldo -= cantidad
    }
}