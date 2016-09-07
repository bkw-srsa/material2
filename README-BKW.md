Dieses Projekt enthält einen Fork des material2 projektes. Es ermöglicht das BKW-konforme Styling der Komponenten.
Wir plegen unsere Änderungen in den 'develop' branch ein.

# Abgleich mit dem Original-Repo
Folgende Schritte werden lokal ausgeführt und setzen voraus dass das originale Repo als upstream zur Verfügung ist:
    git remote add upstream https://github.com/angular/material2.git

1. upstream aktualisieren:
     git fetch upstream
2. auf develop HEAD wechseln:
     git checkout develop && git pull
3. tag auf dem aktuellen Stand machen (entspricht der bkw Version)
     git tag ${BKW_VERSION}
3. merge des gewünschten Tags ausführen:
     git merge ${MATERIAL_TAG}
4. entsprechende Dateien manuell mergen
     Potientieller Konflikt: /package.json 
5. version aktualisieren
     ./updateVersion.sh
6. git commit
7. git push --all

# Entwickeln:

Alle Abhängigkeiten werden von unserem Nexus geholt. Dieser benötigt eine Authentifizierung.
Dazu wird in der Datei .npmrc die Umgebungsvariable mit dem Token benötigt.
Dieses Token ist persönlich und darf nicht eingecheckt werden, weil das Projekt auf github gehostet ist.

Um ein solches Token zu erstellen sind folgende Schritte notwendig:

1. npm login --registry=https://nexus.vc-nord.de/nexus/repository/npm/
   In ~/.npmrc erscheint ein Eintrag (z.B.):
    //nexus.vc-nord.de/nexus/repository/npm/:_authToken=1c39a7d5-272c-31c2-d0a7-2b06ea9cce19
2. Das token muss als Umgebungsvariable bereitgestellt werden:
   export NPM_TOKEN=1c39a7d5-272c-31c2-d0a7-2b06ea9cce19
   
Weitere Infos: https://docs.npmjs.com/private-modules/ci-server-config#getting-an-authentication-token

# Versionierung:

Die originalbibliothek erstellt die Tags für neue alpha releases: 2.0.0-alpha.7
Jedoch werden auf npm des öfteren auch Bibliotheken bereitgestellt die minor versionen davon sind ohne dass Tags dazu existieren (2.0.0-alpha.7-3). 
Hier muss man sich jeweils am package.json orientieren.

Die originale Bibliothek steht z.B. mit der Version 2.0.0-alpha.7-3 zur verfügung.
Unsere änderungen werden später mit der Version 2.0.0-alpha.7-3-bkw-1 bereitgestellt.
Die letzte Ziffer wird mit jedem von unseren releases inkrementiert.

	  
# Deployment in unseren Nexus:

Aktuell wird jeder push auf den 'bkw-develop' auf unserem nexus bereitgestellt.
Dazu existiert der npm shortcut: 'npm run release'
    
Aktuell ist das deployment über 'gulp publish' nicht möglich.