@NoFuncional @Rendimiento @EP01 @US02
Feature: US02 - Búsqueda de estudiantes
  Como psicóloga de bienestar
  Quiero buscar a un estudiante por su nombre o código universitario
  Para encontrar su perfil rápidamente

  Background:
    Given la psicóloga "Valeria Torres" ha ingresado a Mi UPC con su cuenta institucional
    And la psicóloga se encuentra en la pantalla "Perfil de casos" del módulo SIPDU

  Scenario Outline: Búsqueda con resultados en 2 segundos o menos
    When la psicóloga escribe "<texto buscado>" en el campo "Buscar estudiante"
    Then el sistema muestra en un máximo de 2 segundos la lista de estudiantes que coinciden
    And cada resultado muestra los campos nombre, código y carrera
    And el primer resultado es el estudiante "<estudiante esperado>"
    Examples:
      | texto buscado | estudiante esperado  |
      | Mateo Ram     | Mateo Ramírez Quispe |
      | Ramírez Qui   | Mateo Ramírez Quispe |
      | U20250001     | Mateo Ramírez Quispe |

  Scenario: Búsqueda sin resultados en 2 segundos o menos
    When la psicóloga escribe "U99999999" en el campo "Buscar estudiante"
    Then el sistema muestra en un máximo de 2 segundos el mensaje "No se encontraron estudiantes con ese dato"
    