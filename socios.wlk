class Socio {
    const actividadRealizada = []
    const property maximoDeActividades
    var property edad
    const property idiomas = [] 


    method esAdoradorAlSol() {
      return actividadRealizada.all({a => a.sirveParaBrocearse()})
    }

    method actividadesEsforzadas() {
      return actividadRealizada.find({a => a.implicaEsfuerzo()})
    }

    method registrarActividad(unaActividad) {
        if(actividadRealizada.size() == maximoDeActividades){
            self.error("Llego al maximo de actividades")
        }
        actividadRealizada.add(unaActividad)
    }

    method leAtrae(unaActividad)
}

class SocioTranquilo inherits Socio {
  override method leAtrae(unaActividad) {
    return unaActividad.cuantosDiasLleva() > 4
  }
}

class SocioCoherente inherits Socio {
  override method leAtrae(unaActividad) {
    if(self.esAdoradorAlSol()){
        return unaActividad.sirveParaBrocearse()
    }else{
        return unaActividad.implicaEsfuerzo()
    }
  }
}

class SocioRelajado inherits Socio {
  override method leAtrae(unaActividad) {
    return not idiomas.intersection(unaActividad.idioma()).isEmpty()
  }
}
