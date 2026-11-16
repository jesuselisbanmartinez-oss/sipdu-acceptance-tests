# language: es
@EP02 @US08
Característica: US08 - Valoración profesional de la clasificación
  Como psicóloga de bienestar
  Quiero indicar si estoy de acuerdo con el nivel de riesgo asignado
  Para dejar constancia de mi criterio profesional

  Antecedentes:
    Dado que la psicóloga "Valeria Torres" ha ingresado a Mi UPC con su cuenta institucional
    Y la psicóloga se encuentra en la pestaña "Nivel de riesgo" del "Perfil del estudiante" de un estudiante con nivel "alto"

  Escenario: Valoración de acuerdo
    Cuando la psicóloga presiona el botón "De acuerdo"
    Entonces el sistema registra la valoración con la fecha y el nombre de la psicóloga
    Y el sistema muestra el texto "Valoración: de acuerdo" con la fecha y el nombre "Valeria Torres"

  Esquema del escenario: Valoración en desacuerdo
    Cuando la psicóloga presiona el botón "En desacuerdo"
    Y la psicóloga completa la ventana "Valoración profesional" con los datos:
      | campo                        | valor        |
      | nivel que considera correcto | <propuesto>  |
      | comentario                   | <comentario> |
    Y la psicóloga presiona el botón "Guardar"
    Entonces el sistema registra la valoración con la fecha y el nombre de la psicóloga
    Y el sistema muestra el nivel asignado por el modelo "alto" junto al nivel propuesto "<propuesto>" hasta la siguiente clasificación

    Ejemplos:
      | propuesto | comentario                                                 |
      | medio     | Las inasistencias se justifican por un tratamiento médico. |
      | crítico   | En la entrevista manifestó la intención de retirarse.      |

  Escenario: Desacuerdo sin comentario
    Dado que la psicóloga se encuentra en la ventana "Valoración profesional"
    Cuando la psicóloga presiona el botón "Guardar" sin completar el campo comentario
    Entonces el sistema no registra la valoración
    Y el sistema muestra el mensaje "El comentario es obligatorio cuando no está de acuerdo"
