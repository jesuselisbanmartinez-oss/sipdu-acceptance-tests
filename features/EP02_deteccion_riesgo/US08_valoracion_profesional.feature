@EP02 @US08
Feature: US08 - Valoración profesional de la clasificación
  Como psicóloga de bienestar
  Quiero indicar si estoy de acuerdo con el nivel de riesgo asignado
  Para dejar constancia de mi criterio profesional

  Background:
    Given la psicóloga "Valeria Torres" ha ingresado a Mi UPC con su cuenta institucional
    And la psicóloga se encuentra en la pestaña "Nivel de riesgo" del "Perfil del estudiante" de un 
    estudiante con nivel "alto"

  Scenario: Valoración de acuerdo
    When la psicóloga presiona el botón "De acuerdo"
    Then el sistema registra la valoración con la fecha y el nombre de la psicóloga
    And el sistema muestra el texto "Valoración: de acuerdo" con la fecha y el nombre "Valeria Torres"

  Scenario Outline: Valoración en desacuerdo
    When la psicóloga presiona el botón "En desacuerdo"
    And la psicóloga completa la ventana "Valoración profesional" con los datos:
      | campo                        | valor        |
      | nivel que considera correcto | <propuesto>  |
      | comentario                   | <comentario> |
    And la psicóloga presiona el botón "Guardar"
    Then el sistema registra la valoración con la fecha y el nombre de la psicóloga
    And el sistema muestra el nivel asignado por el modelo "alto" junto al nivel propuesto "<propuesto>" 
    hasta la siguiente clasificación
    Examples:
      | propuesto | comentario                                                 |
      | medio     | Las inasistencias se justifican por un tratamiento médico. |
      | crítico   | En la entrevista manifestó la intención de retirarse.      |

  Scenario: Desacuerdo sin comentario
    Given la psicóloga se encuentra en la ventana "Valoración profesional"
    When la psicóloga presiona el botón "Guardar" sin completar el campo comentario
    Then el sistema no registra la valoración
    And el sistema muestra el mensaje "El comentario es obligatorio cuando no está de acuerdo"

    