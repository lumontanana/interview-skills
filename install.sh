#!/usr/bin/env bash
# Instala las skills de este pack (*.skill) en un proyecto de Claude Code.
#
# Uso:
#   ./install.sh [ruta-proyecto] [--global]
#
#   ruta-proyecto   Carpeta del proyecto destino (por defecto: directorio actual)
#   --global        Instala en ~/.claude/skills en vez de <proyecto>/.claude/skills,
#                    para que las skills queden disponibles en todos tus proyectos
#
# Ejemplos:
#   ./install.sh                     # instala en ./.claude/skills
#   ./install.sh ../mi-otro-proyecto # instala en esa carpeta
#   ./install.sh --global            # instala para todos tus proyectos

set -euo pipefail

usage() {
    sed -n '2,15p' "$0" | sed 's/^# \{0,1\}//'
}

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL=0
TARGET_DIR="."

for arg in "$@"; do
    case "$arg" in
        --global) GLOBAL=1 ;;
        -h|--help) usage; exit 0 ;;
        *) TARGET_DIR="$arg" ;;
    esac
done

if [ "$GLOBAL" = "1" ]; then
    DEST="$HOME/.claude/skills"
else
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Error: la carpeta '$TARGET_DIR' no existe." >&2
        exit 1
    fi
    DEST="$(cd "$TARGET_DIR" && pwd)/.claude/skills"
fi

mkdir -p "$DEST"

shopt -s nullglob
skills=("$SOURCE_DIR"/*.skill)
if [ ${#skills[@]} -eq 0 ]; then
    echo "No se encontraron archivos .skill en $SOURCE_DIR" >&2
    exit 1
fi

extract() {
    local archive="$1" dest="$2"
    if command -v unzip >/dev/null 2>&1; then
        unzip -o -q "$archive" -d "$dest"
    elif command -v python3 >/dev/null 2>&1; then
        python3 -c "import zipfile,sys; zipfile.ZipFile(sys.argv[1]).extractall(sys.argv[2])" "$archive" "$dest"
    else
        echo "Error: se necesita 'unzip' o 'python3' para instalar las skills." >&2
        exit 1
    fi
}

for skill in "${skills[@]}"; do
    name="$(basename "$skill" .skill)"
    rm -rf "${DEST:?}/$name"
    extract "$skill" "$DEST"
    echo "  + $name"
done

echo ""
echo "Instaladas ${#skills[@]} skills en: $DEST"
