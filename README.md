# 🎯 interview-skills

**Un pack de skills para [Claude Code](https://claude.com/claude-code) pensado para entrenar entrevistas técnicas de backend en directo.**

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

Cada `*.skill` es un paquete `.zip` con el formato estándar de Claude Code: `<nombre>/SKILL.md`.

---

## 🚀 Instalación

Clona este repo y ejecuta el instalador. Puedes instalar las skills **en un proyecto concreto** o **globalmente** (disponibles en todos tus proyectos).

```bash
git clone https://github.com/lumontanana/interview-skills.git
cd interview-skills
```

### Windows · PowerShell

```powershell
# Instalar en el directorio actual
.\install.ps1

# Instalar en otro proyecto
.\install.ps1 C:\ruta\a\mi-proyecto

# Instalar globalmente (~\.claude\skills, para todos tus proyectos)
.\install.ps1 -Global
```

### macOS / Linux / Git Bash

```bash
# Instalar en el directorio actual
./install.sh

# Instalar en otro proyecto
./install.sh ../mi-proyecto

# Instalar globalmente (~/.claude/skills, para todos tus proyectos)
./install.sh --global
```

Ambos scripts descomprimen cada `*.skill` en `<proyecto>/.claude/skills/<nombre>/`, que es donde Claude Code busca las skills de un proyecto. No necesitas `unzip` en Windows (usa `System.IO.Compression`); en Linux/macOS usa `unzip` o, si no está disponible, `python3` como fallback.

---

## ✅ Comprobar que se instalaron

Dentro del proyecto donde las instalaste:

```bash
ls .claude/skills
```

Deberías ver las cuatro carpetas (`mapea-preguntas`, `corrige-teoria`, `completa-snippet`, `optimiza-codigo`), cada una con su `SKILL.md`. Claude Code las detecta automáticamente en la siguiente sesión — no hace falta reiniciar nada más que abrir el proyecto.

---

## 🗂️ Estructura del repo

```
interview-skills/
├── completa-snippet.skill
├── corrige-teoria.skill
├── mapea-preguntas.skill
├── optimiza-codigo.skill
├── install.ps1     # instalador para PowerShell / Windows
├── install.sh       # instalador para bash / macOS / Linux
└── README.md
```
