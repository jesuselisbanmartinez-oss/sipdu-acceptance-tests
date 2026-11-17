@EP03 @US09
Feature: US09 - Generación de alerta por aumento del riesgo
  Como psicóloga de bienestar
  Quiero que el sistema genere una alerta cuando aumente el nivel de riesgo de un estudiante
  Para contactarlo antes de que decida abandonar

  Scenario Outline: Generación de la alerta según el cambio de nivel
    Given el estudiante "U20250010" tiene un nivel de riesgo "<nivel anterior>"
    And el estudiante no tiene una alerta activa
    When la clasificación semanal asigna al estudiante el nivel de riesgo "<nivel nuevo>"
    Then el sistema "<resultado>" una alerta para la psicóloga responsable
    Examples:
      | nivel anterior | nivel nuevo | resultado |
      | bajo           | medio       | genera    |
      | medio          | alto        | genera    |
      | alto           | crítico     | genera    |
      | bajo           | bajo        | no genera |
      | alto           | medio       | no genera |

  Scenario: Contenido y plazo de la alerta
    Given el estudiante "U20250010" tiene un nivel de riesgo "medio"
    When la clasificación semanal del 23/11/2026 asigna al estudiante el nivel de riesgo "alto"
    Then el sistema genera la alerta dentro de las 72 horas posteriores a la clasificación con los campos:
      | campo             | valor      |
      | estudiante        | U20250010  |
      | nivel anterior    | medio      |
      | nivel nuevo       | alto       |
      | fecha de la señal | 23/11/2026 |
    And el sistema muestra la alerta con el estado "pendiente" en la pantalla "Alertas" de la psicóloga responsable

  Scenario: Estudiante con alerta activa
    Given el estudiante "U20250010" tiene una alerta en estado "en seguimiento"
    When la clasificación semanal detecta una nueva señal de riesgo del mismo estudiante
    Then el sistema agrega la nueva señal con su fecha a la alerta existente
    And el sistema no crea una alerta nueva