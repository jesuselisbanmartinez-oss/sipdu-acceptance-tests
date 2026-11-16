# language: es
@NoFuncional @Seguridad @EP09 @US34
Característica: US34 - Acceso por rol desde Mi UPC
  Como psicóloga de bienestar
  Quiero que el módulo SIPDU de Mi UPC solo muestre la información de los estudiantes a usuarios con el rol Psicóloga
  Para proteger la confidencialidad de los casos

  Escenario: Ingreso con rol Psicóloga
    Dado que la psicóloga tiene asignado el rol Psicóloga en su cuenta institucional
    Cuando la psicóloga ingresa a Mi UPC con su cuenta institucional
    Entonces el sistema muestra en el menú de Mi UPC la opción "SIPDU"
    Y el sistema muestra las opciones del módulo:
      | opción          |
      | Perfil de casos |
      | Alertas         |
      | Consultas       |
      | Agenda          |
      | Mis horarios    |
      | Reportes        |
      | Indicadores     |

  Escenario: Ingreso con rol Estudiante
    Dado que el estudiante tiene el rol Estudiante en su cuenta institucional
    Cuando el estudiante ingresa a Mi UPC con su cuenta institucional
    Entonces el sistema muestra la sección "Bienestar" con las opciones:
      | opción        |
      | Servicios     |
      | Reservar cita |
      | Mis citas     |
      | Mis consultas |
      | Mi plan       |
    Y el sistema no muestra la opción "SIPDU"

  Esquema del escenario: Acceso directo sin permiso
    Dado que un usuario con el rol "<rol>" ha ingresado a Mi UPC
    Cuando el usuario abre la dirección de la pantalla "<pantalla>" del módulo SIPDU
    Entonces el sistema no muestra la pantalla
    Y el sistema muestra el mensaje "No tiene permiso para acceder a esta sección"

    Ejemplos:
      | rol        | pantalla              |
      | Estudiante | Perfil de casos       |
      | Estudiante | Perfil del estudiante |
      | Docente    | Alertas               |
      | Docente    | Reportes              |
