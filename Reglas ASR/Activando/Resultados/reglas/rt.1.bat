@echo off

set RegFile=C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Menu\1.reg

regedit /s "%RegFile%"

if %errorlevel% equ 0 (
    echo Archivo %RegFile% importado correctamente.
    
    for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "DateTime=%%I"
    set "DateTime=%DateTime:~0,4%-%DateTime:~4,2%-%DateTime:~6,2% %DateTime:~8,2%:%DateTime:~10,2%:%DateTime:~12,2%"
    
    echo Importación de %RegFile% %DateTime% >> "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\resultado_log.txt"
) else (
    echo Error al importar el archivo %RegFile%.
)

exit /b
