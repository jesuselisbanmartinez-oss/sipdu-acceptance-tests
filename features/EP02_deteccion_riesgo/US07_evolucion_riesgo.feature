@EP02 @US07
Feature: US07 - Evolución del riesgo en el ciclo
  Como psicóloga de bienestar
  Quiero ver cómo cambió el nivel de riesgo de un estudiante durante el ciclo
  Para saber si su situación mejora o empeora

  Background:
    Given la psicóloga ha ingresado a Mi UPC con su cuenta institucional
    And la psicóloga se encuentra en la pantalla "Perfil del estudiante" del módulo SIPDU

  Scenario: Evolución disponible
    Given el estudiante "U20250003" tiene las siguientes clasificaciones de riesgo en el ciclo:
      | semana | nivel |
      | 3      | bajo  |
      | 4      | bajo  |
      | 5      | medio |
      | 6      | alto  |
    When la psicóloga selecciona la pestaña "Evolución del riesgo"
    Then el sistema muestra el gráfico "Nivel de riesgo por semana" con las semanas 3, 4, 5 y 6
    And el sistema resalta en color rojo las semanas en las que el nivel aumentó:
      | semana |
      | 5      |
      | 6      |

  Scenario: Una sola clasificación
    Given el estudiante "U20250006" tiene una sola clasificación de riesgo en el ciclo con el nivel "medio"
    When la psicóloga selecciona la pestaña "Evolución del riesgo"
    Then el sistema muestra el nivel de riesgo actual "medio"
    And el sistema muestra el mensaje "La evolución estará disponible desde la segunda clasificación"