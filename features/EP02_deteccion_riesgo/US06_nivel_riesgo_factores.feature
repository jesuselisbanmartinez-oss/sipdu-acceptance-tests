@EP02 @US06
Feature: US06 - Nivel de riesgo con factores explicativos
  Como psicóloga de bienestar
  Quiero ver el nivel de riesgo de deserción de cada estudiante junto con los factores que lo explican
  Para identificar a tiempo a quienes necesitan apoyo

  Background:
    Given el modelo de riesgo de SIPDU utiliza los siguientes umbrales:
      | factor                     | umbral |
      | Inasistencias consecutivas | 3      |
      | Nota aprobatoria           | 12     |
      | Cursos desaprobados        | 2      |

  Scenario Outline: Asignación del nivel de riesgo
    Given el estudiante "<código>" registra en el ciclo actual <inasistencias> inasistencias consecutivas, un promedio de <promedio> y <desaprobados> cursos desaprobados
    When el sistema ejecuta la clasificación semanal de riesgo
    Then el sistema asigna al estudiante el nivel de riesgo "<nivel>"
    And el sistema muestra el campo "Nivel de riesgo" con el valor "<nivel>" en la pantalla "Perfil del estudiante"
    Examples:
      | código    | inasistencias | promedio | desaprobados | nivel   |
      | U20250001 | 0             | 15.5     | 0            | bajo    |
      | U20250002 | 2             | 12.8     | 1            | medio   |
      | U20250003 | 4             | 11.0     | 2            | alto    |
      | U20250004 | 6             | 8.5      | 3            | crítico |

  Scenario: Consulta de los factores del riesgo
    Given la psicóloga ha ingresado a Mi UPC con su cuenta institucional
    And la psicóloga se encuentra en la pantalla "Perfil del estudiante" del estudiante "U20250003" con nivel de riesgo "alto"
    When la psicóloga selecciona la pestaña "Nivel de riesgo"
    Then el sistema muestra los tres factores que más influyeron en la clasificación:
      | nombre del factor          | valor del estudiante | umbral |
      | Inasistencias consecutivas | 4                    | 3      |
      | Cursos desaprobados        | 2                    | 2      |
      | Promedio ponderado         | 11.0                 | 12     |
    And el sistema muestra cada factor con el formato "Inasistencias consecutivas: 4 (umbral 3)"

  Scenario: Datos insuficientes para clasificar
    Given el estudiante "U20250005" no cuenta con notas registradas en el ciclo actual
    When el sistema ejecuta la clasificación semanal de riesgo
    Then el sistema muestra el campo "Nivel de riesgo" con el valor "Sin clasificación"
    And el sistema muestra el mensaje "Faltan las notas del ciclo actual para clasificar al estudiante"