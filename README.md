# 🎯 interview-skills

**Un pack de skills para agentes de código (Claude Code, Codex y más) pensado para entrenar entrevistas técnicas de backend en directo.**

`mapea-preguntas` es el punto de entrada: recorre tu proyecto y te dice qué repasar y con qué skill. `corrige-teoria` te hace pasar por el mismo proceso que un entrevistador senior espera. `completa-snippet` y `optimiza-codigo` van al grano: te muestran las opciones u optimizaciones más óptimas de negocio/implementación, con sus trade-offs, para que aprendas a elegir con criterio antes del día real.

---

## 📦 Qué incluye

| Skill | Cuándo se activa | Qué hace |
|---|---|---|
| 🗺️ **`mapea-preguntas`** | *"analiza este proyecto y dime qué preguntas hay"* | Rastrea un proyecto entero (TODOs, ejercicios, ficheros de teoría) y genera un mapa de qué hay que repasar y con qué skill. Es el punto de entrada antes de una sesión. |
| 🧠 **`corrige-teoria`** | *"te explico cómo funciona un HashMap..."* | Corrige explicaciones teóricas (estructuras de datos, JVM, Spring, BBDD, concurrencia...) con el mismo rigor que un entrevistador senior evaluándote en directo. |
| ✍️ **`completa-snippet`** | *"ayúdame a completar esto"* | Muestra las opciones de implementación más óptimas (negocio + implementación) para el hueco o TODO, te deja elegir, y escribe y explica la que elijas. |
| ⚡ **`optimiza-codigo`** | *"revisa este código y dime qué mejorarías"* | Code review sobre código que ya funciona: rendimiento, legibilidad, complejidad, manejo de errores. Da directamente las mejoras más óptimas con su trade-off. |

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
