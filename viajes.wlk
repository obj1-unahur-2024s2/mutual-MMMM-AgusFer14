class Viaje {
    const property idioma

    method implicaEsfuerzo()

    method sirveParaBrocearse()

    method cuantosDiasLleva()

    method esInteresante() {
      return idioma > 1
    }

    method esRecomendada(unSocio) {
      self.esInteresante() and unSocio.leAtrae(self) and not unSocio.actividadRealizada().contains(self)
    }
}

class ViajeDePlaya inherits Viaje {
  const property largo

  override method cuantosDiasLleva() {
    return largo / 500
  }

  override method implicaEsfuerzo() {
    return largo > 1200
  }

  override method sirveParaBrocearse() {
    return true
  }
}

class ExcursionALaCiudad inherits Viaje {
  const property atraccionesAVisitar

  override method cuantosDiasLleva() {
    return atraccionesAVisitar / 2
  }

  override method implicaEsfuerzo() {
    return atraccionesAVisitar.between(5, 8)
  }

  override method sirveParaBrocearse() {
    return false
  }

  override method esInteresante() {
      return super() or atraccionesAVisitar == 5
    }
}

class ExcursionALaCiudadTropical inherits ExcursionALaCiudad {
  override method cuantosDiasLleva() {
    return super() + 1
  }

  override method sirveParaBrocearse() {
    return true
  }
}

class SalidaDeTrekking inherits Viaje {
  const property kilometrosARecorrer
  const property diasDeSol 

  override method cuantosDiasLleva() {
    return kilometrosARecorrer / 50
  }

  override method implicaEsfuerzo() {
    return kilometrosARecorrer > 80
  }

  override method sirveParaBrocearse() {
    return diasDeSol > 200 or (diasDeSol.between(100, 200) and kilometrosARecorrer > 120)
  }

  override method esInteresante() {
      return super() and diasDeSol > 140
    }
}

class ClaseDeGimnasia inherits Viaje {
  override method idioma() {
    return "español"
  }

  override method cuantosDiasLleva() {
    return 1
  }

  override method implicaEsfuerzo() {
    return true
  }

  override method sirveParaBrocearse() {
    return false
  }

  override method esRecomendada(unSocio) {
    unSocio.edad().between(20, 30)
  }
}

class TallerLiterario inherits Viaje {
  const libroQueSeTrabaja = []

  method idiomasUsados() {
    return libroQueSeTrabaja.filter({l => l.idioma()})
  }

  override method cuantosDiasLleva() {
    return libroQueSeTrabaja.size() + 1
  }

  override method implicaEsfuerzo() {
    // return libroQueSeTrabaja.any({l => l.cantidadDePaginas() > 500}) or 
  }

  override method sirveParaBrocearse() {
    return false
  }

  override method esRecomendada(unSocio) {
    unSocio.idiomas().size() > 1
  }
}

class Libro {
  const property idioma
  const property cantidadDePaginas
  const property nombreDelAutor   
}