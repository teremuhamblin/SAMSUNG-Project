# ============================================
#  Makefile — Samsung Devices & OS Knowledge Suite
# ============================================

# Variables
PYTHON=python3
VENV=venv
ACTIVATE=. $(VENV)/bin/activate

# -------------------------
#  Installation & Setup
# -------------------------

install:
	$(PYTHON) -m venv $(VENV)
	$(ACTIVATE) && pip install -r requirements.txt
	$(ACTIVATE) && $(PYTHON) tools/setup.py

setup:
	$(ACTIVATE) && $(PYTHON) tools/setup.py

# -------------------------
#  API
# -------------------------

run-api:
	$(ACTIVATE) && uvicorn src.api.main:app --reload

# -------------------------
#  CLI
# -------------------------

cli:
	$(ACTIVATE) && $(PYTHON) src/cli/main.py

# -------------------------
#  Tests
# -------------------------

test:
	$(ACTIVATE) && pytest

# -------------------------
#  Integration Makefile
# -------------------------

docs:
	./tools/pipeline.sh

# -------------------------
#  Lint & Format
# -------------------------

lint:
	$(ACTIVATE) && flake8 src

format:
	$(ACTIVATE) && black src

# -------------------------
#  Documentation
# -------------------------

docs:
	$(ACTIVATE) && mkdocs serve

# -------------------------
#  Nettoyage
# -------------------------

clean:
	rm -rf __pycache__ */__pycache__ .pytest_cache .mypy_cache htmlcov

clean-all: clean
	rm -rf $(VENV)

# -------------------------
#  Aide
# -------------------------

help:
	@echo "Commandes disponibles :"
	@echo "  make install      → Installation complète"
	@echo "  make setup        → Initialisation du projet"
	@echo "  make run-api      → Lancer l'API"
	@echo "  make cli          → Lancer la CLI"
	@echo "  make test         → Lancer les tests"
	@echo "  make lint         → Linter le code"
	@echo "  make format       → Formater le code"
	@echo "  make docs         → Lancer la doc"
	@echo "  make clean        → Nettoyer les fichiers temporaires"
	@echo "  make clean-all    → Nettoyer + supprimer le venv"
