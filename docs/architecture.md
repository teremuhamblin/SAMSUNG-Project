markdown

🏛️ Architecture du Projet — Samsung Devices & OS Knowledge Suite

Ce document décrit l’architecture complète du projet, incluant toutes les fonctionnalités ajoutées :  
- Génération de documentation multi‑langages  
- Pipeline automatisé  
- Scripts d’installation  
- Génération statique (Java)  
- Index dynamique (Rust)  
- Sitemap (Lisp)  
- MDX Next.js  
- Moteur de recherche PHP  
- Docker & Docker Compose  
- Structure API / CLI / Parsers

---

1. Structure générale

`
samsung-project/
│
├── docs/                → Documentation source (.md)
├── docs_mdx/            → Documentation Next.js (.mdx)
├── public/              → Site statique généré (.html)
├── src/                 → API, CLI, parsers (Python)
├── data/                → Données JSON, CSV, specs
├── tools/               → Scripts multi-langages
├── assets/              → Branding, images, diagrammes
├── tests/               → Tests Python
│
├── Dockerfile           → Build multi-stage (API + site)
├── docker-compose.yaml  → Services (Nginx, API, builder)
├── Makefile             → Commandes globales
├── requirements.txt     → Dépendances Python
└── INSTALL.md           → Guide d’installation
`

---

2. Pipeline de documentation

Le pipeline est orchestré par :

`
tools/pipeline.sh
`

Il exécute :

| Étape | Langage | Fichier | Rôle |
|------|----------|---------|------|
| 1 | Java | StaticSiteGenerator.java | Génère les pages HTML |
| 2 | Rust | generate_index.rs | Génère l’index dynamique |
| 3 | Lisp | generate_sitemap.lisp | Génère sitemap.xml |
| 4 | Node.js | generate-docs-next.js | Génère les fichiers MDX |
| 5 | CSS | theme.css | Applique le thème One UI |

Sortie finale : public/

---

3. API (Python)

`
src/api/
│
├── main.py
├── routes/
├── utils/
`

Framework : FastAPI  
Serveur : Uvicorn

---

4. CLI (Python)

`
src/cli/
│
├── main.py
├── commands/
└── utils/
`

Framework : Click

---

5. Parsers (Python)

`
src/parsers/
│
├── scraper.py
├── normalizer.py
└── exporter.py
`

---

6. Scripts d’installation

`
tools/
│
├── install_windows.bat
├── install_linux.sh
├── install.ps1
└── setup.py
`

---

7. Génération statique & outils

`
tools/
│
├── StaticSiteGenerator.java
├── generate_index.rs
├── generate_sitemap.lisp
├── generate-docs-next.js
└── BuildTool.java
`

---

8. Moteur de recherche interne

`
public/search.php
`

Fonction : recherche dans tous les .html générés.

---

9. Docker & Conteneurisation

- Dockerfile multi‑stage (Python + Java + Nginx)
- docker-compose.yaml (site + API + builder)

---

10. Thème graphique

`
public/theme.css
`

Style premium inspiré de Samsung One UI.

---

11. Extensions utilisées

Voir : FILEEXTENSIONS.md et filetype.json.

---

12. Conclusion

Le projet est désormais un écosystème complet, multi‑langages, modulaire, automatisé, capable de générer un site statique professionnel, une API, une CLI, un moteur de recherche interne et une documentation Next.js.

`

---
