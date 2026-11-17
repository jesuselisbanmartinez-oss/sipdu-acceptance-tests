@EP03 @US12 @NoFuncional @Rendimiento
Feature: US12 - Notificación de nueva alerta
  Como psicóloga de bienestar
  Quiero recibir una notificación en mi correo institucional cuando se me asigne una nueva alerta
  Para revisarla aunque no tenga el módulo SIPDU abierto

  Scenario: Envío de la notificación en un máximo de 15 minutos
    Given el sistema asignó una nueva alerta a la psicóloga "Valeria Torres"
    When la alerta queda registrada en la pantalla "Alertas"
    Then el sistema envía en un máximo de 15 minutos un correo con los datos:
      | campo        | valor                                  |
      | destinatario | correo institucional de Valeria Torres |
      | asunto       | Nueva alerta asignada en SIPDU         |
      | enlace       | ventana "Detalle de la alerta"         |
    And el asunto del correo no contiene el nombre ni el código del estudiante

  Scenario Outline: Indicador de notificaciones no leídas
    Given la psicóloga tiene <no leídas> notificaciones no leídas
    When la psicóloga ingresa a Mi UPC con su cuenta institucional
    And la psicóloga abre el módulo SIPDU
    Then el sistema muestra en la barra superior el ícono de notificaciones con el indicador "<indicador>"
    Examples:
      | no leídas | indicador  |
      | 1         | 1          |
      | 5         | 5          |
      | 0         | sin número |