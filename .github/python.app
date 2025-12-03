name: Run Python App

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  run-app:
    runs-on: ubuntu-latest

    steps:
      # 1. Récupérer le code du repo
      - name: Checkout repository
        uses: actions/checkout@v4

      # 2. Installer Python 3.10
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'

      # 3. Installer les dépendances
      - name: Install dependencies
        run: |
          pip install --upgrade pip
          pip install -r requirements.txt

      # 4. Lancer l'app
      - name: Run application
        run: |
          python app.py
