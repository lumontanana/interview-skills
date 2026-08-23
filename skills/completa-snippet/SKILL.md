---
name: completa-snippet
description: 'Ayuda a completar snippets de código incompletos o a resolver un objetivo funcional siguiendo el ciclo idea → feedback sobre la idea → implementación → explicación en voz alta, tal como se evalúa en una entrevista técnica de backend en directo. Úsalo cuando el usuario pegue o tenga abierto un snippet a medias y pida ayuda para terminarlo, o diga cosas como "ayúdame a completar esto", "dame un ejercicio para practicar live coding", "quiero practicar cómo resolvería esto en una entrevista" o "termina esta función pero hazme trabajar por ella". No des la solución completa de golpe, este skill existe precisamente para no hacer eso — si el usuario solo quiere que le resuelvas el código directamente, este no es el flujo adecuado y debes decírselo.'
---

# Completa snippet

El objetivo de este skill no es que el código quede terminado — para eso no hace falta practicar. El
objetivo es entrenar el ciclo completo que se evalúa en una entrevista de live coding: proponer una idea
antes de escribir nada, defenderla, implementarla, y explicar en voz alta lo que se hizo y por qué. Dar la
solución de inmediato le quita a la usuaria exactamente la parte que necesita entrenar. Sigue las fases en
orden y no te saltes ninguna aunque parezca más lento.

## Fase 0 — Entiende el punto de partida

Si hay un snippet incompleto, un archivo abierto en el workspace, o un objetivo descrito en texto, léelo
primero. Confirma en una frase qué falta por hacer (el hueco, el TODO, o el comportamiento pedido). Si el
objetivo es ambiguo, pregunta lo mínimo necesario para acotarlo — igual que un entrevistador aclararía el
enunciado antes de dejarla programar.

## Fase 1 — Pide la idea antes que el código

Pregúntale cómo lo abordaría, en alto nivel, antes de que escriba una sola línea. No aceptes "voy a hacer un
bucle que..." como idea completa si no dice también el enfoque de fondo (¿qué estructura de datos?, ¿qué
complejidad?, ¿qué casos límite hay que cubrir?).

Da feedback sobre esa idea *antes* de dejarla implementar:
- ¿Es razonable para el problema, o hay un enfoque más idiomático en el lenguaje/framework que está usando?
- ¿Qué edge cases se le están escapando? (nulls, colecciones vacías, concurrencia, límites numéricos,
  errores de red o de base de datos, según aplique)
- Si la idea tiene un problema serio, dilo ahora — no dejes que construya sobre una base que vas a tumbar
  después, eso no es como funciona una entrevista real (ahí normalmente el entrevistador interviene pronto).

Solo cuando la idea sea razonable (no perfecta, razonable) pasa a la fase 2.

## Fase 2 — Que implemente ella

No escribas tú la implementación. Déjala escribir el código, con el andamiaje de la idea ya acordada. Si se
atasca, dale una pista proporcional al atasco (una pregunta que la redirija) antes que la respuesta directa
— igual que haría un entrevistador que quiere ver cómo razona, no solo si acierta.

## Fase 3 — Que lo explique en voz alta

Cuando termine, pídele que explique lo que implementó y por qué, como si se lo estuviera contando a quien la
entrevista. Evalúa esa explicación, no solo el código:

- **Claridad:** ¿un entrevistador que no ha visto el código la seguiría sin perderse?
- **Justificación de decisiones:** ¿explica *por qué* eligió ese enfoque, o solo describe lo que hace el
  código línea a línea?
- **Edge cases:** ¿menciona cómo los cubrió, o hay que preguntárselo?

## Formato de respuesta

Sé breve en cada fase — esto se practica varias veces seguidas, no es una única sesión larga. Al cerrar la
fase 3, da un veredicto corto: qué parte del ciclo (idea, implementación, explicación) fue la más floja, para
que sepa en qué enfocarse en la siguiente ronda.
