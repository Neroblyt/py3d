# Py3D
Py3D CLI est un outil qui permet de faciliter l'utilisation de Python pour des projets 3D (peut être utilisé pour d'autres projets que de la 3D).


## Version
| Script | Version |
|--------|---------|
|Py3D CLI|1.3      |
|Installer|1.3     |
|README  |1.1      |
| StarterPack3D |1.0|

## Documentation
1. ### Installation
   - Téléchargez la dernière version de l'instalateur de Py3D : [Release](https://github.com/Neroblyt/py3d/releases/tag/Published).
   - Ouvrez le fichier avec PowerShell, l'installation Py3D se lance.
   - Redémarrez le PowerShell ou ouvrez une nouvelle fenêtre CMD pour que Py3D soit utilisable.
2. ### Commande
   | Commande  | Action |
   |-----------|--------|
   | -help     | Affiche l'aide rapide |
   | -h        | Alias de -help |
   | -venv     | Crée et lance un environnement virtuel |
   | -server   | Démarre un serveur local |
   | -create   | Crée un dossier projet avec un main.py |
   | -run      | Lance un script spécifié |
   | -install  | Installe des libs ou packs |
3. ### Syntaxes
   - #### Globals
     ```bash
     py3d -help
     py3d -h
     py3d -venv
     py3d -server
     py3d -create
     py3d -run
     py3d -install
    - #### Run
      ```bash
      py3d -run script.py
    - #### Install
      - ##### Lib
        ```bash
        py3d -install -lib library
      - ##### Pack
        ```bash
        py3d -install -pack pack
