import cosas.* 

object casaDePepeYJulian {
    const cosasCompradas = [] 

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
        return cosasCompradas.any({cosa => cosa.esDeCategoria(categoria)})
    }

    //################################################################################

    method vieneDeComprar(categoria){
        return self.compraronAlgo() && cosasCompradas.last().esDeCategoria(categoria)
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
        if(self.compraronAlgo()) {
            return cosasCompradas.max({cosa => cosa.precio()})
        } else { return 0 }
    }

    //################################################################################

    method comprados(categoria){
        return cosasCompradas.filter({cosa => cosa.esDeCategoria(categoria)})
    }

    //################################################################################

    method malaEpoca(){
        return cosasCompradas.all({cosa => cosa.esDeCategoria(comida)})
    }

    //################################################################################

    method queFaltaComprar(lista){
        return lista.filter({cosa => not self.seCompro(cosa)})
    }

    method seCompro(cosaABuscar) {
        return cosasCompradas.any({cosa => cosa == cosaABuscar})
    }

    //################################################################################

    method faltaComida(){
        return self.cantidadDeComidaComprada() < 2
    }

    method cantidadDeComidaComprada() {
        return self.comidaComprada().size()
    }

    method comidaComprada(){
        return cosasCompradas.filter({cosa => cosa.esDeCategoria(comida)})
    }

    //################################################################################

    method categoriasCompradas(){
        return cosasCompradas.map({cosa => cosa.categoria()}).asSet()
    }
}
