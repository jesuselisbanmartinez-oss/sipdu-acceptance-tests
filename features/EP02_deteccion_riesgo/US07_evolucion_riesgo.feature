# language: es
@EP02 @US07
Característica: US07 - Evolución del riesgo en el ciclo
  Como psicóloga de bienestar
  Quiero ver cómo cambió el nivel de riesgo de un estudiante durante el ciclo
  Para saber si su situación mejora o empeora

  Antecedentes:
    Dado que la psicóloga ha ingresado a Mi UPC con su cuenta institucional
    Y la psicóloga se encuentra en la pantalla "Perfil del estudiante" del módulo SIPDU

  Escenario: Evolución disponible
    Dado que el estudiante "U20250003" tiene las siguientes clasificaciones de riesgo en el ciclo:
      | semana | nivel |
      | 3      | bajo  |
      | 4      | bajo  |
      | 5      | medio |
      | 6      | alto  |
    Cuando la psicóloga selecciona la pestaña "Evolución del riesgo"
    Entonces el sistema muestra el gráfico "Nivel de riesgo por semana" con las semanas 3, 4, 5 y 6
    Y el sistema resalta en color rojo las semanas en las que el nivel aumentó:
      | semana |
      | 5      |
      | 6      |

  Escenario: Una sola clasificación
    Dado que el estudiante "U20250006" tiene una sola clasificación de riesgo en el ciclo con el nivel "medio"
    Cuando la psicóloga selecciona la pestaña "Evolución del riesgo"
    Entonces el sistema muestra el nivel de riesgo actual "medio"
    Y el sistema muestra el mensaje "La evolución estará disponible desde la segunda clasificación"
