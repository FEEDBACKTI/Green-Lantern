@echo off

Echo Ejecutando...

REM Verificar si el archivo tx1.bat existe antes de llamarlo

set "tx1=C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\tx1.bat"

if exist "%tx%" (
    call "%tx%"

    echo tx1.bat ha finalizado.

) else (
    echo El archivo tx1.bat no fue encontrado en la ubicacion especificada.
)

echo regla_1 ha finalizado.

