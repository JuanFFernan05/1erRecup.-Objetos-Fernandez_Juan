import magos.* 

class Gremio{
    var miembros = #{}                  // Gremios y/o magos
    var puntosDeEnergiaMagica

    method poderTotal(){
        return miembros.sum({miembro => miembro.poderTotal()})
    }

    method reservaDeEnergiaMagica(){
        const reserva = miembros.sum({miembro => miembro.puntosDeEnergiaMagica()})
        return reserva
        puntosDeEnergiaMagica = reserva
    }

    method liderDelGremio(){                                // Segun el punto B3, el lider puede ser un mago o un gremio
        return miembros.max({miembro => miembro.poderTotal()})
    }

    method resistenciaMagica(){
        return miembros.sum({miembro => miembro.resistenciaMagica()})
    }

    method resistenciaDelLider(){
        return self.liderDelGremio().resistenciaMagica()
    }

    method reservaDelLider(){
        return self.liderDelGremio().puntosDeEnergiaMagica()
    }

    method desafiar(unOponente){
         if(unOponente.puedeVencerlo(self)){
            const puntos = unOponente.puntosPerdidos()
            unOponente.disminuirPuntos(puntos)
            self.aumentarPuntos(puntos)
         }
    }

    method puedeVencerlo(unOponente){           // En este metodo, suponemos un gremio
        return unOponente.poderTotal() > self.resistenciaMagica() + self.resistenciaDelLider()*2
    }

    method disminuirPuntos(puntos){
        puntosDeEnergiaMagica -=puntos
    }

    method aumentarPuntos(puntos){
        puntosDeEnergiaMagica += puntos
    }

    method puntosPerdidos(){                        // Cuando un gremio es derrotado, la cantidad de puntos que pierde equivale a la cantidad de puntos perdido por cada miembro
        return miembros.sum({mago => mago.puntosPerdidos()})
    }
}