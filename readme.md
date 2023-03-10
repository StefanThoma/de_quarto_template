Dies ist eine Vorlage für Quarto Books auf deutsch.

# Struktur

Wir haben mehrere Ordner. Hier eine kurze Darstellung, was wo zu finden ist: 

- chapters: Hier finden wir die .qmd files der Kapitel
- images: Hier sollen alle pngs & jpgs gespeichert werden. Ausserdem finden wir hier auch das Favicon.
- data: Alle Daten, die im Buch benutzt werden, sollten hier gespeichert sein.
- R: Hier können wir R-Scripts speichern. Die sind nützlich für Helferfunktionen.
- inst: Hier finden wir alle files für den spell-check.
- .github/workflows: Versteckter Ordner; GitHub workflows werden hier gespeichert. 
- docs: Hier hinein wird das Buch gerendert. Da finden wir auch das PDF des Buches.
- bib: Hier werden die .bib files gespeichert. Wir haben per default zwei davon.
  - Eines davon kann direkt mit R erstellt werden (packages), das andere mit zotero.
  
  
  
# Anleitung


Erstelle zuerst zwei branches auf GitHub: 
`develop` und `gh-pages`
Arbeite auf dem branch `develop` und erstelle einen pull-request auf `main`. 
Danach kannst Du auf `develop` pushen und bekommst ständiges feedback zu den CICD checks.

Verändere dann das _quarto.yml file, so dass die Projektdaten -- Autor, Titel -- stimmen.
Erstelle ein neues Favicon, [zum Beispiel online](https://favicon.io/favicon-generator/). 
Schreib neue Kapitel im `chapters` Ordner und füge sie entsprechend im _quarto.yml ein. 
Beachte dabei: Weil wir im _quarto.yml `execute-dir: project` spezifiziert haben, ist der current working directory auf der Projektebene. 
Das ist unabhängig davon, wo sich das file befindet, das gerade ausgeführt wird. 
Sprich: Wenn wir in einem Kapitel in dem `chapters` Ordner arbeiten und auf die Daten zugreifen möchten, können wir direkt mit dem Pfad: "data/nameofdata" arbeiten, wir müssen also nicht zuerst in den parent-directory zurück.
packages.bib erstellst Du mit dem RScript `generateReferences.R`, dazu musst Du nur packages hinzufügen.

## rendern
Du kannst im Terminal mit 

`quarto render`

das Buch rendern. 

Mit 

`quarto preview`

kannst Du das Buch rendern und beobachten, während Du das Buch veränderst. 


## Spellcheck
Wir haben einen GitHub workflow für einen Deutschen Spell-Check eingerichtet. 
Dieser wird automatisch ausgeführt, sobald ein pull-request auf den main branch gemacht wird. 
Dafür brauchen wir die files in dem `inst` Ordner.
de_CH_frami.dic und de_CH_frami.aff sind die zwei dictionary files. 
Zusätzlich können wir im WORDLIST.txt file Wörter definieren, die ignoriert werden sollen. 
In dem Ordner R befindet sich ein R-Script `CICD.R` womit wir die WORDLIST.txt anpassen können.

## Stylecheck
In dem Ordner R befindet sich ein R-Script `CICD.R`. 
Damit können wir den Stylecheck durchführen, bevor wir mit main mergen.

## Publish
Bei einem angenommenen merge-request wird das Buch automatisch auf den github branch `gh-pages` neu gerendert. Dafür müssen wir aber das Buch einmal lokal rendern.
