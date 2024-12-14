import magos.*

class ObjetoConBaseDePoder{
    var baseDePoder

    method baseDePoder(){
        return baseDePoder
    }

    method poder(unMago)

}

class Varita inherits ObjetoConBaseDePoder{

    override method poder(unMago){
        if(unMago.nombrePar()){
            return self.baseDePoder()*1.5
        }else{
            return self.baseDePoder()
        }
    }

}

class Tunica inherits ObjetoConBaseDePoder{

    override method poder(unMago){
        return self.baseDePoder() + 2*(unMago.resistenciaMagica()) + self.puntosAdicionales()
    }

    method puntosAdicionales()

}


class TunicaComun inherits Tunica{

    override method puntosAdicionales(){
        return 0
    }
}

class TunicaEpica inherits Tunica{

    override method puntosAdicionales(){
        return 10
    }
}



class Amuleto{

    method poder(unMago){
        return 200
    }

}

object ojota{
    
    method poder(unMago){
        return 10*(unMago.nombre().length())
    }

}

