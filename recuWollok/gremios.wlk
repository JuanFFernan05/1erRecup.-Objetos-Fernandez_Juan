import magos.* 

class Gremio{
    var miembros = #{}                  // Gremios y/o magos


    method poderTotal(){
        return miembros.sum({miembro => miembro.poderTotal()})
    }

    method reservaDeEnergiaMagica(){
        return miembros.sum({miembro => miembro.puntosDeEnergiaMagica()})
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
         if(self.puedeVencerlo(unOponente)){
            const puntos = unOponente.puntosPerdidos()
            unOponente.disminuirPuntos(puntos)              // Este parámetro es necesario por si el oponente es un mago
            self.aumentarPuntos(puntos)
         }
    }

    method puedeVencerlo(unOponente){                          // Aclaración: ya que no se indica como un gremio puede vencer a un mago, asumo que la condición es la misma que se realiza para confirmar si un gremio puede vencer a un gremio
        return self.poderTotal() > unOponente.resistenciaMagica() + self.resistenciaDelLider()
    }


    method disminuirPuntos(){                         // Cuando un gremio pierde, cada miembro pierde sus puntos correspondientes
        miembros.forEach({miembro => miembro.disminuirPuntos(miembro.puntosPerdidos())})
    }

    method aumentarPuntos(puntos){              
        self.liderDelGremio().aumentarPuntos(puntos)
    }

    method puntosPerdidos(){
        return miembros.sum({miembro => miembro.puntosPerdidos()})
    }

}