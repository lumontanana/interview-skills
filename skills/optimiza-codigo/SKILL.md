---
name: optimiza-codigo
description: 'Revisa código que ya funciona y sugiere directamente sus optimizaciones más óptimas de rendimiento, legibilidad, complejidad algorítmica, manejo de errores y uso idiomático del lenguaje o framework, explicando el trade-off real de cada cambio. Úsalo cuando el usuario pida optimizar, mejorar o revisar código que ya escribió o tiene abierto, o diga cosas como "cómo optimizarías esto", "revisa este código y dime qué mejorarías", "qué le pondrías pegas a esto" o "hazme de code reviewer". No es para depurar código roto (eso es diagnosticar un bug), sino para mejorar código que ya funciona.'
---

# Optimiza código

Estás revisando código que ya funciona para ayudar al usuario a mejorarlo. El objetivo es que se lleve las
mejoras más óptimas con su razonamiento, no ponerlo a prueba.

## Antes de sugerir nada, sitúa el código

Lee el código real (el que pegó, el snippet, o el archivo relevante del proyecto abierto en el workspace).
No inventes ejemplos genéricos si hay código real disponible — las sugerencias solo valen si están ancladas
a las líneas concretas que escribió.

## Qué buscar

Revisa estos ángulos, pero solo señala lo que de verdad importa para ese código — llenar la respuesta de
micro-sugerencias irrelevantes es tan poco útil como no ver nada:

- **Rendimiento:** complejidad algorítmica evitable, trabajo repetido, estructuras de datos mal elegidas
  para el acceso que se hace sobre ellas, problemas típicos de backend como N+1 queries o falta de índices
  implícitos en el acceso a datos.
- **Legibilidad y diseño:** nombres, funciones que hacen demasiado, acoplamiento innecesario — cosas que un
  revisor senior marcaría aunque el código "funcione".
- **Manejo de errores:** qué pasa con nulls, colecciones vacías, concurrencia, fallos de red o de base de
  datos, excepciones tragadas silenciosamente.
  <!-- Lista de edge cases emparentada con la de skills/completa-snippet/SKILL.md (fase 4). Si cambias una,
       revisa la otra para que no diverjan. -->
- **Idiomatismo:** si hay una forma más propia del lenguaje o framework (streams en vez de bucles manuales
  en Java, por ejemplo, cuando de verdad mejora algo y no es cambio por cambio).
- **Testabilidad:** si la estructura actual dificulta escribir un test para esto.

## El trade-off es la parte importante

Para cada sugerencia, no te quedes en "mejor así". Di explícitamente qué se gana y qué se sacrifica —
rendimiento a cambio de legibilidad, simplicidad a cambio de flexibilidad futura, etc. Si una sugerencia no
tiene trade-off real (es una mejora estrictamente superior, sin coste), dilo también: distinguir "esto es
objetivamente mejor" de "esto depende" es tan útil como la sugerencia en sí.

Antes de dar una sugerencia por buena, comprueba si el código o su contexto (comentarios, un patrón
consistente en el resto del proyecto, una restricción evidente) ya explican por qué se escribió así. Si la
razón es visible y válida, ajusta o descarta la sugerencia en vez de proponer un cambio que la ignora — sin
necesidad de preguntarle al usuario por qué lo hizo. Si no hay ninguna razón visible, da la sugerencia igual,
como recomendación.

## Formato de respuesta

Ordena las sugerencias de más a menos importantes, no en el orden en que aparecen en el código. Para cada
una: qué cambiarías y el trade-off (o, si no tiene trade-off real, dilo explícitamente: es una mejora
estrictamente superior). Cierra con una frase sobre cómo queda el código en conjunto tras aplicar las
sugerencias más importantes — una valoración constructiva, no un veredicto de aprobado/suspenso.
