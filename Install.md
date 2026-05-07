📄 INSTALL.md

`markdown

🚀 INSTALLATION
Guide d’installation — Samsung Devices & OS Knowledge Suite

Ce document explique comment installer, configurer et lancer le projet pour la première fois.

---

📦 1. Prérequis

Assurez-vous d’avoir installé :

- Python 3.10 ou supérieur
- Git
- pip ou pipx
- (Optionnel) Virtualenv ou conda

---

📁 2. Cloner le projet

`bash
git clone https://github.com/<votre-utilisateur>/samsung-project.git
cd samsung-project
`

---

🧪 3. Créer un environnement virtuel

`bash
python3 -m venv venv
source venv/bin/activate   # Linux / macOS
venv\Scripts\activate      # Windows
`

---

📥 4. Installer les dépendances

`bash
pip install -r requirements.txt
`

(Le fichier requirements sera généré plus tard si tu le souhaites.)

---

🛠️ 5. Initialiser le projet

Le projet inclut un script de setup permettant de :

- créer les dossiers manquants  
- vérifier la structure  
- installer les dépendances  
- préparer les datasets  

Exécute simplement :

`bash
python tools/setup.py
`

---

▶️ 6. Lancer l’API (si activée)

`bash
uvicorn src.api.main:app --reload
`

---

💻 7. Utiliser la CLI

`bash
python src/cli/main.py --help
`

---

📚 8. Documentation

Toute la documentation se trouve dans :

`
/docs/
`

---

🧪 9. Lancer les tests

`bash
pytest
`

---

🎉 Votre environnement est prêt

Vous pouvez maintenant explorer, développer et contribuer au projet.
`

---

🛠️ Script de setup : tools/setup.py

Voici un script Python simple, propre et efficace pour initialiser ton projet :

`python

!/usr/bin/env python3
import os
import json

PROJECT_DIRS = [
    "docs",
    "data",
    "data/raw",
    "data/specs",
    "src",
    "src/api",
    "src/cli",
    "src/parsers",
    "src/utils",
    "assets",
    "assets/images",
    "assets/diagrams",
    "assets/branding",
    "tests",
    "tools"
]

def create_directories():
    print("📁 Vérification des dossiers…")
    for d in PROJECT_DIRS:
        if not os.path.exists(d):
            os.makedirs(d)
            print(f"  ➕ Créé : {d}")
        else:
            print(f"  ✔ Existe déjà : {d}")

def createplaceholderfiles():
    print("\n📄 Création de fichiers placeholder…")
    placeholders = {
        "data/devices.json": [],
        "data/os_versions.json": [],
        "data/raw/sources.md": "# Sources de données\n",
        "assets/branding/palette.md": "# Palette de couleurs Samsung\n",
    }

    for path, content in placeholders.items():
        if not os.path.exists(path):
            with open(path, "w", encoding="utf-8") as f:
                if isinstance(content, list):
                    json.dump(content, f, indent=4)
                else:
                    f.write(content)
            print(f"  ➕ Créé : {path}")
        else:
            print(f"  ✔ Existe déjà : {path}")

def main():
    print("🚀 Initialisation du projet Samsung Devices & OS Knowledge Suite\n")
    create_directories()
    createplaceholderfiles()
    print("\n🎉 Setup terminé ! Votre projet est prêt.")

if name == "main":
    main()
`

---

📍 Où placer ces fichiers ?

Voici l’emplacement exact :

`
samsung-project/
│
├── INSTALL.md          ← à la racine
│
├── tools/
│   └── setup.py        ← dans /tools/
`

---
