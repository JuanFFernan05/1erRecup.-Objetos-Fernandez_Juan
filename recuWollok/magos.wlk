import gremios.* 
import objetos.*
import noSePuedeCrearUnGremioException.*


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

    method categoria(){
        return categoria
    }

    method puedeVencerlo(unMago){
        return unMago.categoria().esVencido(unMago, self)            // El primer mago enviado por parámetro es aquel "dueño" de la categoria
    }

    method puntosPerdidos(){
        return categoria.puntosAPerder(self)
    }

    method puntosDeEnergiaMagica(){
        return puntosDeEnergiaMagica
    }

    method aumentarPuntos(puntos){
        puntosDeEnergiaMagica += puntos
    }

    method disminuirPuntos(puntos){
        puntosDeEnergiaMagica -= puntos
    }

    method resistenciaDelLider(){       // El valor de esta resistencia lo tiene en cuenta para el gremio (no en uso individual)
        return 0
    }




    // Suponemos que un mago es responsable de crear un gremio

    method crearGremio(algunosMiembros){
        if(self.suficienteParaCrearUnGremio(algunosMiembros)){
           const gremio = new Gremio(miembros = algunosMiembros)         
        }else{
            throw new NoSePuedeCrearUnGremioException(message = "No hay suficientes miembros para crear un gremio")
        }
    }

    method suficienteParaCrearUnGremio(algunosMiembros){
        return algunosMiembros.size() >= 2
    }
    
}




object inmortal{

    method esVencido(unMago, oponente){
        return false
    }

    method puntosAPerder(unMago){
        return 0
    }
}

object aprendiz{

    method esVencido(unMago, oponente){
        return unMago.resistenciaMagica() < oponente.poderTotal()
    }

    method puntosAPerder(unMago){
        return unMago.puntosDeEnergiaMagica() / 2
    }

}

object veterano{

    method esVencido(unMago, oponente){
        return oponente.poderTotal()*1.5 >= unMago.resistenciaMagica() 
    }

    method puntosAPerder(unMago){
        return unMago.puntosDeEnergiaMagica() / 4
    }

}