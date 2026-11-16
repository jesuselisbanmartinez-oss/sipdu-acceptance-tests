# language: es
@EP03 @US09
Característica: US09 - Generación de alerta por aumento del riesgo
  Como psicóloga de bienestar
  Quiero que el sistema genere una alerta cuando aumente el nivel de riesgo de un estudiante
  Para contactarlo antes de que decida abandonar

  Esquema del escenario: Generación de la alerta según el cambio de nivel
    Dado que el estudiante "U20250010" tiene un nivel de riesgo "<nivel anterior>"
    Y el estudiante no tiene una alerta activa
    Cuando la clasificación semanal asigna al estudiante el nivel de riesgo "<nivel nuevo>"
    Entonces el sistema "<resultado>" una alerta para la psicóloga responsable

    Ejemplos:
      | nivel anterior | nivel nuevo | resultado |
      | bajo           | medio       | genera    |
      | medio          | alto        | genera    |
      | alto           | crítico     | genera    |
      | bajo           | bajo        | no genera |
      | alto           | medio       | no genera |

  Escenario: Contenido y plazo de la alerta
    Dado que el estudiante "U20250010" tiene un nivel de riesgo "medio"
    Cuando la clasificación semanal del 23/11/2026 asigna al estudiante el nivel de riesgo "alto"
    Entonces el sistema genera la alerta dentro de las 72 horas posteriores a la clasificación con los campos:
      | campo             | valor      |
      | estudiante        | U20250010  |
      | nivel anterior    | medio      |
      | nivel nuevo       | alto       |
      | fecha de la señal | 23/11/2026 |
    Y el sistema muestra la alerta con el estado "pendiente" en la pantalla "Alertas" de la psicóloga responsable

  Escenario: Estudiante con alerta activa
    Dado que el estudiante "U20250010" tiene una alerta en estado "en seguimiento"
    Cuando la clasificación semanal detecta una nueva señal de riesgo del mismo estudiante
    Entonces el sistema agrega la nueva señal con su fecha a la alerta existente
    Y el sistema no crea una alerta nueva
