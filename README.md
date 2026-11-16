# SIPDU – Pruebas de aceptación (Gherkin)

Repositorio de los archivos `.feature` de **SIPDU – Sistema Inteligente de Prevención de la Deserción Universitaria** (startup IncaTech, curso 1ASI0786 Ingeniería de Requisitos, NRC 6954).

## Estructura

```
features/
├── EP02_deteccion_riesgo/    US06, US07, US08
├── EP03_alertas_tempranas/   US09, US10 (no funcional), US11, US12 (no funcional)
└── no_funcionales/           US04, US34
```

- Idioma Gherkin: español (`# language: es`).
- Cada archivo corresponde a una user story y lleva las etiquetas de su epic y de su historia (por ejemplo, `@EP02 @US06`).
- Las tablas `Ejemplos` y las data tables contienen los datos de prueba.
- Total: 9 archivos, 22 escenarios y 41 casos ejecutables.
- Historias no funcionales cubiertas: US04, US10, US12 y US34 (etiqueta `@NoFuncional`).

## Convenciones

- Commits con Conventional Commits, por ejemplo: `test(EP02): add US06 risk level scenarios`.
- Una rama `feature/USxx` por historia, integrada a `develop` mediante pull request revisado por otro integrante.
