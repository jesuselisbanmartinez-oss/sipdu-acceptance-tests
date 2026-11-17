# SIPDU – Pruebas de aceptación (Gherkin)

Repositorio de los archivos `.feature` de **SIPDU – Sistema Inteligente de Prevención de la Deserción Universitaria** (startup IncaTech, curso 1ASI0786 Ingeniería de Requisitos, NRC 6954).

## Estructura

```
features/
├── EP02_deteccion_riesgo/    US06, US07, US08
├── EP03_alertas_tempranas/   US09, US10 (no funcional), US11, US12 (no funcional)
└── no_funcionales/           US02, US04, US34
```

- Palabras clave de Gherkin en inglés (`Feature`, `Background`, `Scenario`, `Scenario Outline`, `Given`, `When`, `Then`, `And`, `Examples`); el resto del texto en español.
- Cada archivo corresponde a una user story y lleva las etiquetas de su epic y de su historia (por ejemplo, `@EP02 @US06`).
- Las tablas `Examples` y las data tables contienen los datos de prueba (inputs y resultados esperados).
- Total: 10 archivos, 24 escenarios y 45 casos de prueba.
- Historias no funcionales cubiertas: US02, US04, US10, US12 y US34 (etiqueta `@NoFuncional`).
- Las pruebas están diseñadas y validadas sintácticamente con el parser oficial de Gherkin; se ejecutarán con Cucumber durante la implementación, como criterio de terminado de cada historia.

## Convenciones

- Commits con Conventional Commits, por ejemplo: `test(EP02): add US06 risk level scenarios`.
- Cada integrante registra sus cambios con commits propios en la rama `main`.