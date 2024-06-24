@echo off

REM Definir la ubicación de los archivos .reg a ejecutar
set RegFile1=C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Menu /1.reg

REM Crear un archivo temporal para modificar el Registro
echo Windows Registry Editor Version 5.00 > %temp%\temp.reg
echo. >> %temp%\temp.reg
echo [HKEY_USERS\.DEFAULT\Control Panel\Mouse] >> %temp%\temp.reg
echo "rx1"="1" >> %temp%\temp.reg

REM Importar el archivo temporal al Registro
regedit /s %temp%\temp.reg

REM Verificar si la importación fue exitosa para el primer archivo
if %errorlevel% equ 0 (
    echo Valor de 'rx1' cambio a 1 correctamente para el primer archivo.

    REM Obtener fecha y hora actual
    for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "DateTime=%%I"
    set "DateTime=%DateTime:~0,4%-%DateTime:~4,2%-%DateTime:~6,2% %DateTime:~8,2%:%DateTime:~10,2%:%DateTime:~12,2%"
    
    REM Registrar el cambio en el archivo de log para el primer archivo
    echo Cambio de 'rx1' a 1 %DateTime% >> "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\resultado_log.txt"
) else (
    echo Error al cambiar el valor de 'rx1' para el primer archivo.
)

REM Importar el segundo archivo .reg al Registro
regedit /s "%RegFile1%"

REM Verificar si la importación fue exitosa para el segundo archivo
if %errorlevel% equ 0 (
    echo Archivo %RegFile1% importado correctamente.

    REM Obtener fecha y hora actual
    for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "DateTime=%%I"
    set "DateTime=%DateTime:~0,4%-%DateTime:~4,2%-%DateTime:~6,2% %DateTime:~8,2%:%DateTime:~10,2%:%DateTime:~12,2%"
    
    REM Registrar la importación en el archivo de log para el segundo archivo
    echo Importación de %RegFile1% %DateTime% >> "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\resultado_log.txt"
) else (
    echo Error al importar el archivo %RegFile1%.
)

REM Eliminar el archivo temporal
del %temp%\temp.reg /f /q

REM Fin del script
exit /b
