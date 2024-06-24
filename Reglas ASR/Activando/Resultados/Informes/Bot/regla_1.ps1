@echo off

Echo Ejecutando...

REM Verificar si el archivo tx.powershell existe antes de llamarlo

set "tx=C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\tx.bat"

if exist "%tx%" (
    call "%tx%"

    echo tx.bat ha finalizado.

) else (
    echo El archivo tx.bat no fue encontrado en la ubicacion especificada.
)

echo regla_1 ha finalizado.

pause
