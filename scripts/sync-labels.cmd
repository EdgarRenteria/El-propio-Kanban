@echo off
setlocal enabledelayedexpansion

REM 1) Definir ruta del repo y CSV
cd /d "C:\Users\edgar\OneDrive - Universidad Nacional de Colombia\ACADEMIC_MANAGEMENT🔥\98-Org.academ\organizacion-academica\kanban-board"
set "File=labels.csv"
set "Owner=edgar"
set "Repo=organizacion-academica/kanban-board"

REM 2) Leer CSV (salta línea de cabecera) y crear/editar etiqueta
for /f "skip=1 tokens=1,2,3 delims=," %%A in ("%File%") do (
  REM Intentar crear; si falla (ya existe), editar
  gh label create %%A --repo %Owner%/%Repo% --color %%B --description "%%C" 2>nul || ^
  gh label edit   %%A --repo %Owner%/%Repo% --color %%B --description "%%C"
)

endlocal
