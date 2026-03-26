@echo off
title Installation du projet Samsung Devices & OS Knowledge Suite
echo ================================================
echo   🚀 Installation du projet Samsung
echo ================================================
echo.

REM Vérification de Python
echo 🔍 Vérification de Python...
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo ❌ Python n'est pas installé. Installe Python 3.10+ puis relance ce script.
    pause
    exit /b
)
echo ✔ Python détecté.
echo.

REM Création de l'environnement virtuel
echo 🧪 Création de l'environnement virtuel...
python -m venv venv
call venv\Scripts\activate
echo ✔ Environnement activé.
echo.

REM Installation des dépendances
IF EXIST requirements.txt (
    echo 📦 Installation des dépendances...
    pip install -r requirements.txt
    echo ✔ Dépendances installées.
) ELSE (
    echo ⚠ Aucun fichier requirements.txt trouvé.
)
echo.

REM Exécution du script de setup
IF EXIST tools\setup.py (
    echo 🛠 Exécution du script de setup...
    python tools\setup.py
) ELSE (
    echo ⚠ Le script tools\setup.py est introuvable.
)
echo.

echo 🎉 Installation terminée !
pause
