#!/bin/bash
mkdir Output
pythonfile=$1
Speicherort="/home/jovyan/pytmextensions/Output/"
seqdianame=$2
reportname=$3
dotdiagramname=$4
echo "Ausgewähltes Python File: $pythonfile"
echo "Sequenzdiagramname: $2"
echo "DFD Diagramname: $4"
echo "Reportname: $3"
echo "Ausgewählter Speicherort: $Speicherort"
python ./$pythonfile --seq | java -Djava.awt.headless=true -jar plantuml.jar -tpng -pipe > $Speicherort$seqdianame
python ./$pythonfile --dfd | dot -Tpng -o $Speicherort$dotdiagramname 
python ./$pythonfile --report docs/template.md | pandoc -f markdown -t html > $Speicherort$reportname
