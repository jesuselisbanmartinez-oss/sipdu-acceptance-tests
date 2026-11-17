@EP03 @US11
Feature: US11 - Gestión del estado de la alerta
  Como psicóloga de bienestar
  Quiero cambiar el estado de una alerta a «en seguimiento» o «atendida»
  Para distinguir los casos pendientes de los que ya trabajé

  Background:
    Given la psicóloga "Valeria Torres" ha ingresado a Mi UPC con su cuenta institucional
    And la psicóloga se encuentra en la ventana "Detalle de la alerta"

  Scenario Outline: Cambio de estado permitido
    Given la alerta está en estado "<estado actual>"
    And el estudiante tiene <intervenciones> intervenciones registradas
    When la psicóloga selecciona "<estado nuevo>" en la lista "Estado"
    Then el sistema actualiza el estado de la alerta a "<estado nuevo>"
    And el sistema registra la fecha del cambio y el nombre "Valeria Torres"
    Examples:
      | estado actual  | intervenciones | estado nuevo   |
      | pendiente      | 0              | en seguimiento |
      | en seguimiento | 1              | atendida       |
      | pendiente      | 2              | atendida       |

  Scenario: Atención sin intervención registrada
    Given la alerta está en estado "pendiente"
    And el estudiante no tiene intervenciones registradas
    When la psicóloga selecciona "atendida" en la lista "Estado"
    Then el sistema no cambia el estado de la alerta
    And el sistema muestra el mensaje 
    "Registre una intervención o un motivo antes de marcar la alerta como atendida" con el campo motivo


    