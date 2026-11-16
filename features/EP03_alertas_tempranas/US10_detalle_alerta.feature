# language: es
@EP03 @US10 @NoFuncional @Usabilidad
Característica: US10 - Detalle de la alerta sin etiquetas
  Como psicóloga de bienestar
  Quiero ver en cada alerta los factores detectados y las acciones de apoyo sugeridas, con un lenguaje que no etiquete al estudiante
  Para decidir cómo acercarme a él

  Antecedentes:
    Dado que la psicóloga ha ingresado a Mi UPC con su cuenta institucional
    Y la psicóloga se encuentra en la pantalla "Alertas" del módulo SIPDU

  Escenario: Consulta del detalle de la alerta
    Cuando la psicóloga selecciona la alerta del estudiante "U20250010" en la lista
    Entonces el sistema muestra la ventana "Detalle de la alerta" con los campos:
      | campo                       | valor                                    |
      | nivel de riesgo             | alto                                     |
      | factores detectados         | Inasistencias consecutivas: 4 (umbral 3) |
      | acciones de apoyo sugeridas | Invitar a una sesión de orientación      |
    Y el sistema muestra al menos una acción de apoyo sugerida

  Esquema del escenario: Lenguaje no estigmatizante
    Dado que la psicóloga se encuentra en la ventana "Detalle de la alerta"
    Cuando el sistema muestra el contenido de la alerta
    Entonces el texto de la alerta no contiene el término "<término no permitido>"

    Ejemplos:
      | término no permitido |
      | problemático         |
      | desertor             |
      | fracasado            |
      | caso perdido         |
