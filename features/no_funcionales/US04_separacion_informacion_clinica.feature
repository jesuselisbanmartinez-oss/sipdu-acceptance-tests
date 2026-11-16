# language: es
@NoFuncional @Confidencialidad @EP01 @US04
Característica: US04 - Separación de la información clínica
  Como psicóloga de bienestar
  Quiero que el resumen académico se muestre separado de la historia clínica
  Para proteger la confidencialidad del estudiante

  Antecedentes:
    Dado que la psicóloga "Valeria Torres" ha ingresado a Mi UPC con su cuenta institucional
    Y existen los siguientes estudiantes con su psicóloga responsable:
      | código    | psicóloga responsable |
      | U20250003 | Valeria Torres        |
      | U20250015 | Lucía Paredes         |

  Escenario: Resumen académico sin información clínica
    Dado que la psicóloga se encuentra en la pantalla "Perfil del estudiante" del estudiante "U20250003"
    Cuando la psicóloga selecciona la pestaña "Resumen académico"
    Entonces el sistema muestra los campos:
      | campo                            |
      | notas por curso                  |
      | asistencia por curso             |
      | observaciones docentes por curso |
    Y el sistema no muestra los campos:
      | campo                                    |
      | motivo de atención                       |
      | antecedentes relevantes                  |
      | fecha de apertura de la historia clínica |

  Esquema del escenario: Acceso a la historia clínica según la responsable del caso
    Dado que la psicóloga se encuentra en la pantalla "Perfil del estudiante" del estudiante "<código>"
    Cuando la psicóloga selecciona la pestaña "Historia clínica"
    Entonces el sistema "<resultado>"

    Ejemplos:
      | código    | resultado                                                                                 |
      | U20250003 | muestra los campos de la historia clínica                                                 |
      | U20250015 | muestra el mensaje "Solo la psicóloga responsable del caso puede ver la historia clínica" |
