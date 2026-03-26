📘 CONTRIBUTING.md

Guide de contribution — Samsung Devices & OS Knowledge Suite

Merci de votre intérêt pour ce projet. Les contributions sont les bienvenues et appréciées.  
Ce document explique comment participer efficacement, dans le respect de la qualité et de la cohérence du projet.

---

🧭 1. Philosophie du projet

Le projet vise à devenir une référence technique et documentaire sur :

- les appareils Samsung  
- leurs systèmes d’exploitation (Android, One UI, Knox, Tizen…)  
- leur architecture, sécurité et performances  
- l’écosystème logiciel Samsung  

Nous valorisons :

- la qualité  
- la rigueur technique  
- la cohérence documentaire  
- la transparence  
- l’amélioration continue  

---

🛠️ 2. Types de contributions acceptées

📚 Documentation
- Ajout ou amélioration de pages dans docs/  
- Corrections techniques  
- Ajout de comparatifs, analyses, historiques  

📊 Données
- Ajout de nouveaux modèles Samsung  
- Mise à jour des spécifications techniques  
- Ajout de benchmarks  
- Correction de datasets existants  

🧪 Code
- Amélioration de l’API  
- Ajout de commandes CLI  
- Scripts d’import, parsing, normalisation  
- Tests unitaires  

🎨 Branding & assets
- Diagrammes  
- Illustrations  
- Amélioration du style documentaire  

---

🧩 3. Structure du projet

Merci de respecter l’architecture existante :

`
docs/        → Documentation
data/        → Datasets (JSON, CSV…)
src/         → API, CLI, parsers, utils
assets/      → Images, diagrammes, branding
tests/       → Tests unitaires
tools/       → Scripts internes
`

---

🧪 4. Règles de qualité

✔ Documentation
- Style clair, concis, structuré  
- Titres cohérents (#, ##, ###)  
- Pas de copier‑coller non sourcé  
- Pas de contenu promotionnel  

✔ Données
- JSON bien formaté  
- Champs cohérents entre modèles  
- Sources vérifiables  
- Benchmarks datés et identifiés  

✔ Code
- Respect du style Python (PEP8)  
- Fonctions documentées  
- Tests unitaires pour toute nouvelle fonctionnalité  
- Pas de dépendances inutiles  

---

🔀 5. Workflow de contribution

1. Fork du dépôt
Créez votre propre copie du projet.

2. Créer une branche dédiée
Exemples :

`
feature/add-galaxy-s24
fix/os-version-typo
docs/update-knox-section
`

3. Commits clairs et explicites
Format recommandé :

`
feat: ajout des specs du Galaxy S24
fix: correction de la version One UI 6.1
docs: ajout de la page sur Knox Vault
`

4. Pull Request
Votre PR doit inclure :

- une description claire  
- les fichiers modifiés  
- les raisons du changement  
- les sources si données techniques  

---

🧪 6. Tests

Avant toute PR :

`
pytest
`

Les contributions sans tests pour le code ne seront pas acceptées.

---

🛡️ 7. Code de conduite

Nous attendons de tous les contributeurs :

- respect  
- communication constructive  
- absence de discrimination  
- transparence dans les échanges  

Les comportements toxiques ne seront pas tolérés.

---

📬 8. Questions & support

Pour toute question :

- Ouvrez une issue GitHub  
- Ou discutez dans la section Discussions du projet  

---

🤝 Merci

Merci de contribuer à faire de ce projet une référence technique sur l’écosystème Samsung.  
Chaque contribution, petite ou grande, aide à construire un outil utile pour tous.

---
