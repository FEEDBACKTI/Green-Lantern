@echo off
echo Ejecutando...

REM Obtener el valor de la propiedad MouseSpeed del registro HKCU:\Control Panel\Mouse
powershell.exe -Command "$value = Get-ItemProperty -Path 'HKCU:\Control Panel\Mouse' -Name MouseSpeed"

REM Verificar si el archivo llamada1.bat existe antes de llamarlo
set "archivoLlamada=C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\llamada1.bat"
if exist "%archivoLlamada%" (
    call "%archivoLlamada%"
    echo llamada1.bat ha finalizado.
) else (
    echo El archivo llamada1.bat no fue encontrado en la ubicación especificada.
)

echo regla_1 ha finalizado.

pause
