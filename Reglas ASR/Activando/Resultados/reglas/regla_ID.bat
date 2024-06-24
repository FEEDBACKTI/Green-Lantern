@echo off

REM Función para ejecutar un archivo .bat según el ID proporcionado
:run_txid
setlocal
set "ID=%~1"

REM Verificar si se proporcionó un ID
if "%ID%"=="" (
    echo Error: Se requiere un ID como parámetro.
    exit /b 1
)

REM Construir la ruta completa del archivo .bat basado en el ID proporcionado
set "BatchFile=C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\tx%ID%.bat"

REM Verificar si el archivo .bat existe antes de ejecutarlo
if not exist "%BatchFile%" (
    echo Error: El archivo %BatchFile% no existe.
    exit /b 1
)

REM Ejecutar el archivo .bat correspondiente
call "%BatchFile%"

REM Verificar el código de error de la ejecución del archivo .bat
if %errorlevel% equ 0 (
    echo Ejecución del archivo %BatchFile% completada correctamente.
) else (
    echo Error al ejecutar el archivo %BatchFile%.
)

endlocal
exit /b