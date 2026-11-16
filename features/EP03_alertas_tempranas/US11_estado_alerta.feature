# language: es
@EP03 @US11
Característica: US11 - Gestión del estado de la alerta
  Como psicóloga de bienestar
  Quiero cambiar el estado de una alerta a «en seguimiento» o «atendida»
  Para distinguir los casos pendientes de los que ya trabajé

  Antecedentes:
    Dado que la psicóloga "Valeria Torres" ha ingresado a Mi UPC con su cuenta institucional
    Y la psicóloga se encuentra en la ventana "Detalle de la alerta"

  Esquema del escenario: Cambio de estado permitido
    Dado que la alerta está en estado "<estado actual>"
    Y el estudiante tiene <intervenciones> intervenciones registradas
    Cuando la psicóloga selecciona "<estado nuevo>" en la lista "Estado"
    Entonces el sistema actualiza el estado de la alerta a "<estado nuevo>"
    Y el sistema registra la fecha del cambio y el nombre "Valeria Torres"

    Ejemplos:
      | estado actual  | intervenciones | estado nuevo   |
      | pendiente      | 0              | en seguimiento |
      | en seguimiento | 1              | atendida       |
      | pendiente      | 2              | atendida       |

  Escenario: Atención sin intervención registrada
    Dado que la alerta está en estado "pendiente"
    Y el estudiante no tiene intervenciones registradas
    Cuando la psicóloga selecciona "atendida" en la lista "Estado"
    Entonces el sistema no cambia el estado de la alerta
    Y el sistema muestra el mensaje "Registre una intervención o un motivo antes de marcar la alerta como atendida" con el campo motivo
