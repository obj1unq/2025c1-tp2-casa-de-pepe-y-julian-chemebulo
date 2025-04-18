import cosas.* 

object casaDePepeYJulian {
    const property cosasCompradas = [] 

    //################################################################################

    method cosasCompradas() {
        return cosasCompradas
    }

    method comprar(cosa){
        return cosasCompradas.add(cosa)
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