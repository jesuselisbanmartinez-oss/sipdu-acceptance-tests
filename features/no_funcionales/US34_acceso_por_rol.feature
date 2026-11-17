@NoFuncional @Seguridad @EP09 @US34
Feature: US34 - Acceso por rol desde Mi UPC
  Como psicóloga de bienestar
  Quiero que el módulo SIPDU de Mi UPC solo muestre la información de los estudiantes a usuarios con el rol Psicóloga
  Para proteger la confidencialidad de los casos

  Scenario: Ingreso con rol Psicóloga
    Given la psicóloga tiene el rol "Psicóloga" en su cuenta institucional
    When la psicóloga ingresa a Mi UPC con su cuenta institucional
    Then el sistema muestra en el menú de Mi UPC la opción "SIPDU"
    And el sistema muestra las opciones del módulo:
      | opción          |
      | Perfil de casos |
      | Alertas         |
      | Consultas       |
      | Agenda          |
      | Mis horarios    |
      | Reportes        |
      | Indicadores     |

  Scenario: Ingreso con rol Estudiante
    Given el estudiante tiene el rol "Estudiante" en su cuenta institucional
    When el estudiante ingresa a Mi UPC con su cuenta institucional
    Then el sistema muestra la sección "Bienestar" con las opciones:
      | opción        |
      | Servicios     |
      | Reservar cita |
      | Mis citas     |
      | Mis consultas |
      | Mi plan       |
    And el sistema no muestra la opción "SIPDU"

  Scenario Outline: Acceso directo sin permiso
    Given un usuario con el rol "<rol>" ingresó a Mi UPC
    When el usuario abre la dirección de la pantalla "<pantalla>" del módulo SIPDU
    Then el sistema no muestra la pantalla
    And el sistema muestra el mensaje "No tiene permiso para acceder a esta sección"
    Examples:
      | rol        | pantalla              |
      | Estudiante | Perfil de casos       |
      | Estudiante | Perfil del estudiante |
      | Docente    | Alertas               |
      | Docente    | Reportes              |