# 🎯 interview-skills

**Un pack de skills para agentes de código (Claude Code, Codex y más) pensado para entrenar entrevistas técnicas de backend en directo.**

En vez de darte la solución, estas skills te hacen pasar por el mismo proceso que un entrevistador senior espera: proponer una idea antes de programar, defenderla, justificar los trade-offs, y explicar en voz alta lo que haces y por qué.

---

## 📦 Qué incluye

| Skill | Cuándo se activa | Qué hace |
|---|---|---|
| 🗺️ **`mapea-preguntas`** | *"analiza este proyecto y dime qué preguntas hay"* | Rastrea un proyecto entero (TODOs, ejercicios, ficheros de teoría) y genera un mapa de qué hay que repasar y con qué skill. Es el punto de entrada antes de una sesión. |
| 🧠 **`corrige-teoria`** | *"te explico cómo funciona un HashMap..."* | Corrige explicaciones teóricas (estructuras de datos, JVM, Spring, BBDD, concurrencia...) con el mismo rigor que un entrevistador senior evaluándote en directo. |
| ✍️ **`completa-snippet`** | *"ayúdame a completar esto"* | Ciclo completo de live coding: idea → feedback sobre la idea → implementación → explicación en voz alta. No suelta la solución de golpe. |
| ⚡ **`optimiza-codigo`** | *"revisa este código como si fueras un entrevistador"* | Code review socrática sobre código que ya funciona: rendimiento, legibilidad, complejidad, manejo de errores. Reta a justificar las decisiones antes de aceptar la mejora. |

> 💡 Flujo típico: `mapea-preguntas` para saber por dónde empezar → `corrige-teoria` / `completa-snippet` / `optimiza-codigo` según lo que toque en cada punto.

---

## 🚀 Instalación

Un único comando, usando la CLI abierta [`skills`](https://skills.sh):

```bash
npx skills@latest add lumontanana/interview-skills
```

Te deja elegir qué skills instalar y en qué agente(s) (Claude Code, Codex, Cursor...). Para instalarlas todas sin preguntas:

```bash
npx skills@latest add lumontanana/interview-skills --skill '*' -y
```

O una en concreto:

```bash
npx skills@latest add lumontanana/interview-skills --skill mapea-preguntas
```

Por defecto se instalan en el proyecto actual (`.claude/skills/`, `.codex/skills/`, etc., según el agente). Para tenerlas disponibles en todos tus proyectos, añade `-g`:

```bash
npx skills@latest add lumontanana/interview-skills -g
```

### Actualizar o quitar

```bash
npx skills update      # trae las últimas versiones de las skills instaladas
npx skills list         # ver qué tienes instalado
npx skills remove       # desinstalar
```

---

## ✅ Comprobar que se instalaron

```bash
npx skills list
```

Deberías ver las skills que hayas elegido, con el agente y el ámbito (proyecto o global) donde quedaron instaladas. Claude Code (y el resto de agentes soportados) las detecta automáticamente en la siguiente sesión.

---

## 🗂️ Estructura del repo

```
interview-skills/
└── skills/
    ├── mapea-preguntas/SKILL.md
    ├── corrige-teoria/SKILL.md
    ├── completa-snippet/SKILL.md
    └── optimiza-codigo/SKILL.md
```

Cada `SKILL.md` sigue el formato estándar de skills para agentes: frontmatter con `name` y `description`, y el cuerpo con las instrucciones que sigue el agente.
