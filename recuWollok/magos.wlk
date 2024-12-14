
class Mago{
    var objetosMagicos = #{}
    var poderInnato
    const nombre
    var resistenciaMagica
    var puntosDeEnergiaMagica
    var categoria

    method poderTotal(){
        return self.poderTotalDeObjetos()*poderInnato
    }

    method poderTotalDeObjetos(){
        return objetosMagicos.sum({objeto => objeto.poder(self)})
    }

    method nombre(){
        return nombre
    }

    method nombrePar(){
        return nombre.even()
    }

    method resistenciaMagica(){
        return resistenciaMagica
    }

    method desafiar(unMago){
        if(self.puedeVencerlo(unMago)){
            const puntos = unMago.puntosPerdidos()
            unMago.disminuirPuntos(puntos)
            self.aumentarPuntos(puntos)
        }
    }

    method puedeVencerlo(unMago){
        return categoria.esVencido(unMago, self)            // El primer mago enviado por parámetro es aquel "dueño" de la categoria
    }

    method puntosPerdidos(){
        return categoria.puntosAPerder(self)
    }

    method puntosDeEnergiaMagica(){
        return puntosDeEnergiaMagica
    }

    method aumentarPuntos(puntos){
        puntosDeEnergiaMagica +=puntos
    }

    method disminuirPuntos(puntos){
        puntosDeEnergiaMagica -= puntos
    }
    
}


object inmortal{

    method esVencido(unMago, otroMago){
        return false
    }

    method puntosAPerder(unMago){
        return 0
    }
}

object aprendiz{

    method esVencido(unMago, otroMago){
        return unMago.resistenciaMagica() < otroMago.poderTotal()
    }

    method puntosAPerder(unMago){
        return unMago.puntosDeEnergiaMagica() / 2
    }

}

object veterano{

    method esVencido(unMago, otroMago){
        return otroMago.poderTotal()*1.5 >= unMago.resistenciaMagica() 
    }

    method puntosAPerder(unMago){
        return unMago.puntosDeEnergiaMagica() / 4
    }

}