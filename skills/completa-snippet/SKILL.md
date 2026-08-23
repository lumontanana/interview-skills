---
name: completa-snippet
description: 'Ayuda a completar snippets de código incompletos o a resolver un objetivo funcional mostrando las opciones de implementación más óptimas (negocio e implementación) antes de escribirlo, para que el usuario elija con criterio en vez de recibir una única respuesta sin contexto. Úsalo cuando el usuario pegue o tenga abierto un snippet a medias y pida ayuda para terminarlo, o diga cosas como "ayúdame a completar esto", "cómo terminarías tú esta función", "dame las opciones para implementar esto y cuál es la más óptima", "quiero ver los enfoques posibles antes de decidir" o "termina esta función, pero explícame por qué la harías así". El skill escribe la implementación elegida y explica el razonamiento; no es un examen ni un simulacro de entrevista.'
---

# Completa snippet

El objetivo de este skill es que el usuario se lleve la implementación más óptima del hueco, TODO u
objetivo que tiene delante, entendiendo por qué es la mejor opción frente a las alternativas razonables.
No es un examen: no le pidas que proponga su propia idea desde cero ni que la defienda antes de dejarla
avanzar. Sigue las fases en orden.

## Fase 0 — Entiende el punto de partida

Si hay un snippet incompleto, un archivo abierto en el workspace, o un objetivo descrito en texto, léelo
primero. Confirma en una frase qué falta por hacer (el hueco, el TODO, o el comportamiento pedido). Si el
objetivo es ambiguo, pregunta lo mínimo necesario para acotarlo.

## Fase 1 — Presenta las opciones de implementación

Antes de escribir nada, identifica las formas viables de resolver el hueco u objetivo — normalmente 2-3.
Para cada opción, una frase de qué hace y su trade-off real de negocio/implementación (rendimiento,
legibilidad, complejidad, encaje con el objetivo real — no solo ingenio algorítmico desconectado del
contexto).

Si de verdad solo hay una forma razonable (el caso es trivial o no hay alternativa sensata), no inventes
alternativas artificiales solo por rellenar la fase — dilo, pasa directamente a la fase 3, y explica en la
fase 4 por qué es la única opción sensata.

Si hay una restricción de contexto que cambiaría cuál opción es la más óptima (tamaño esperado del dataset,
concurrencia, si el código es desechable o va a producción, límites de tiempo/memoria), pregúntala antes o
junto con las opciones — solo cuando de verdad cambie la elección, no por rutina.

## Fase 2 — Pregunta cuál prefiere

Si planteaste varias opciones, pregúntale cuál prefiere. Si no tiene una preferencia clara, o te pide
directamente que decidas tú, recomienda la que consideres más óptima y di en una frase por qué. Si solo
había una opción razonable, salta esta fase.

## Fase 3 — Implementa la opción elegida

Escribe tú el código de la opción elegida, completo y correcto. No dejes el hueco a medias ni le pidas que
lo termine ella — el objetivo de este skill es que tenga una solución que estudiar, no que la fuerces a
escribirla bajo presión.

## Fase 4 — Explica el razonamiento

Explica por qué esta opción es la más óptima frente a las descartadas: qué se ganó, qué se sacrificó, y cómo
esas decisiones se reflejan en el código real que acabas de escribir (ancla la explicación a partes
concretas del código, no a generalidades). Menciona los edge cases relevantes (nulls, colecciones vacías,
concurrencia, límites numéricos, errores de red o de base de datos, según aplique) y cómo la implementación
los cubre.

<!-- Esta lista de edge cases también aparece en skills/optimiza-codigo/SKILL.md ("Manejo de errores").
     Si cambias una, revisa la otra para que no diverjan. -->

## Formato de respuesta

Sé breve en las fases 0 a 3. En la fase 4, prioriza cubrir el razonamiento y los edge cases sobre la
brevedad. Cierra con un resumen de una frase: qué se implementó y en qué se diferenciaba de las opciones
descartadas. No hay veredicto sobre el desempeño del usuario — esto no es una evaluación.
