#!/bin/bash

echo "==============================================="
echo "  📚 Génération de documentation HTML5"
echo "==============================================="
echo ""

# Vérification de pandoc
if ! command -v pandoc &> /dev/null
then
    echo "❌ Pandoc n'est pas installé. Installe-le puis relance ce script."
    exit
fi

SRC_DIR="docs"
OUT_DIR="docs_html"

# Création du dossier de sortie
mkdir -p $OUT_DIR

echo "🔍 Conversion des fichiers Markdown..."
for file in $(find $SRC_DIR -name "*.md"); do
    filename=$(basename "$file" .md)
    pandoc "$file" -o "$OUT_DIR/$filename.html" --standalone --metadata title="$filename" -f markdown -t html5
    echo "✔ $filename.html généré"
done

echo ""
echo "🎉 Documentation HTML générée dans $OUT_DIR/"
