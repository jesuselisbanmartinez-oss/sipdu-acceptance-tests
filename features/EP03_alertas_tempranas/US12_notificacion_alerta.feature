# language: es
@EP03 @US12 @NoFuncional @Rendimiento
Característica: US12 - Notificación de nueva alerta
  Como psicóloga de bienestar
  Quiero recibir una notificación en mi correo institucional cuando se me asigne una nueva alerta
  Para revisarla aunque no tenga el módulo SIPDU abierto

  Escenario: Envío de la notificación
    Dado que el sistema ha asignado una nueva alerta a la psicóloga "Valeria Torres"
    Cuando la alerta queda registrada en la pantalla "Alertas"
    Entonces el sistema envía en un máximo de 15 minutos un correo con los datos:
      | campo        | valor                                  |
      | destinatario | correo institucional de Valeria Torres |
      | asunto       | Nueva alerta asignada en SIPDU         |
      | enlace       | ventana "Detalle de la alerta"         |
    Y el asunto del correo no contiene el nombre ni el código del estudiante

  Esquema del escenario: Notificaciones no leídas
    Dado que la psicóloga tiene <no leídas> notificaciones no leídas
    Cuando la psicóloga ingresa a Mi UPC con su cuenta institucional y abre el módulo SIPDU
    Entonces el sistema muestra en la barra superior del módulo el ícono de notificaciones con el indicador "<indicador>"

    Ejemplos:
      | no leídas | indicador  |
      | 1         | 1          |
      | 5         | 5          |
      | 0         | sin número |
