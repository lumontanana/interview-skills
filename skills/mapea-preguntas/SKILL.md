---
name: mapea-preguntas
description: 'Rastrea un proyecto de código entero en busca de todas las preguntas, ejercicios o puntos de repaso teórico que contiene (TODOs, comentarios de ejercicio, ficheros de resumen de teoría, nombres de clase tipo "EjercicioX" o "XxxDemo", secciones de README con preguntas o teoría) y produce un análisis estructurado: qué hay, de qué trata cada uno, y qué otro skill (corrige-teoria, completa-snippet u optimiza-codigo) conviene usar para trabajarlo. Es el punto de partida antes de ponerse a repasar con los demás skills de preparación de entrevista. Úsalo cuando el usuario abra un proyecto de práctica y pida cosas como "analiza este proyecto y dime qué preguntas hay", "mapea todo lo que tengo que repasar aquí", "haz un análisis de este archivo/proyecto antes de que lo repasemos" o "dime qué ejercicios tengo pendientes en este repo". No resuelve ni corrige nada por sí mismo — genera el mapa, no las respuestas.'
---

# Mapea preguntas

Este skill es el punto de entrada antes de una sesión de repaso, no la sesión en sí. Su único trabajo es
recorrer un proyecto y devolver un mapa fiable de qué hay para repasar y por dónde empezar — la usuaria
luego decide, pregunta a pregunta, qué otro skill invocar (`corrige-teoria` para defender un concepto,
`completa-snippet` para terminar código a medias, `optimiza-codigo` para revisar algo que ya funciona).

## Por qué no inventar preguntas

Es tentador, si no encuentras marcadores claros, generar preguntas plausibles sobre el código para tener
algo que enseñar. No lo hagas: el valor de este skill es la fiabilidad del inventario. Si dices que hay una
pregunta sobre `HashMap` en `Ejercicio3.java` pero en realidad no hay nada ahí, la usuaria pierde tiempo de
repaso yendo a un sitio vacío la noche antes de una entrevista. Si el rastreo no encuentra suficientes
marcadores claros, dilo explícitamente y pregunta cómo están marcadas las preguntas en ese proyecto en
concreto, en vez de asumir un formato.

## Dónde buscar

Recorre el proyecto entero, no solo el archivo que esté abierto — el objetivo es el inventario completo.
Busca en, al menos:

- **Comentarios de código** con marcadores de ejercicio o pregunta: `// TODO`, `// PREGUNTA`, `// Q:`,
  `// EJERCICIO`, `/* ... */` que planteen algo a resolver o explicar, `FIXME`.
- **Nombres de clases, métodos o paquetes** que delaten un ejercicio: `Ejercicio1`, `HashMapDemo`,
  `SortingPractice`, `RepasoXxx`, tests con nombres descriptivos tipo `deberiaLanzarExcepcionCuandoXxx`.
- **Ficheros de resumen o teoría** en el proyecto (README, `NOTES.md`, `TEORIA.md`, cualquier markdown con
  secciones tipo "Preguntas", "Teoría", "Repaso", "Ejercicios", listas numeradas de conceptos).
- **JavaDoc o docstrings** que describan qué se espera que haga o explique el código.
- **Código deliberadamente incompleto**: métodos vacíos, `throw new UnsupportedOperationException()`,
  bloques con `// implementar aquí` — esto normalmente es una tarea de `completa-snippet`, no de teoría.

## Cómo clasificar cada hallazgo

Para cada pregunta o ejercicio que encuentres, decide a qué categoría pertenece — esto es lo que le dice a
la usuaria qué skill llamar después:

- **Teoría** (→ `corrige-teoria`): pide explicar cómo funciona algo, no escribir código nuevo. Ejemplo: un
  comentario que pregunta "¿por qué es más rápido HashMap que TreeMap aquí?".
- **Snippet a completar** (→ `completa-snippet`): hay código incompleto, un TODO de implementación, o un
  método vacío que hay que rellenar.
- **Código a optimizar** (→ `optimiza-codigo`): el código ya funciona (compila, tiene tests que pasan) pero
  hay una nota o convención que sugiere que se puede mejorar, o simplemente es candidato porque está
  terminado y sin marcar como pendiente.

Si un hallazgo no encaja claramente en ninguna, dilo así en vez de forzarlo en una categoría.

## Formato del análisis

Organiza el resultado por **tema** (estructuras de datos, Spring, concurrencia, SQL/JPA, algoritmos, etc.),
no por archivo — así se parece más a cómo se estudia para una entrevista que a un listado de ficheros.
Dentro de cada tema, para cada pregunta/ejercicio incluye:

- Dónde está (archivo y, si aplica, línea o método).
- Una frase de qué pide, en tus palabras — no copies el comentario tal cual si es ambiguo, interprétalo.
- Categoría (teoría / snippet / optimización) y qué skill usar para ella.
- Si es evidente que algo está a medias o roto, márcalo como prioritario — eso es lo que más conviene
  repasar antes de lo que ya está sólido.

Cierra con un resumen de 2-3 líneas: cuántas preguntas encontraste en total, cómo se reparten entre las tres
categorías, y por qué tema empezarías tú si el tiempo fuera limitado.

Si el proyecto es grande, no hace falta que reproduzcas el análisis completo en un único bloque denso:
puedes proponer guardarlo como un fichero markdown en el proyecto (por ejemplo `ANALISIS_REPASO.md`) para
que sirva de checklist a medida que vaya trabajando cada punto con los demás skills — pero pregúntalo, no lo
des por hecho si no lo pidió.
