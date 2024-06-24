@echo off

REM Definir la ubicación del archivo .reg a ejecutar
set RegFile1=C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Menu\1.reg

REM Crear un archivo temporal para modificar el Registro
echo Windows Registry Editor Version 5.00 > %temp%\temp.reg
echo. >> %temp%\temp.reg
echo [HKEY_USERS\.DEFAULT\Control Panel\Mouse] >> %temp%\temp.reg
echo "rx3"="3" >> %temp%\temp.reg

REM Importar el archivo temporal al Registro
regedit /s %temp%\temp.reg

REM Verificar si la importación fue exitosa
if %errorlevel% equ 0 (
    echo Valor de 'rx2' cambiado a 3 correctamente.
    
    REM Obtener fecha y hora actual
    for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "DateTime=%%I"
    set "DateTime=%DateTime:~0,4%-%DateTime:~4,2%-%DateTime:~6,2% %DateTime:~8,2%:%DateTime:~10,2%:%DateTime:~12,2%"
    
    REM Registrar el cambio en el archivo de log
    echo Cambio de 'rx2' a 3 %DateTime% >> "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\resultado_log.txt"
) else (
    echo Error al cambiar el valor de 'rx2'.
)

REM Eliminar el archivo temporal
del %temp%\temp.reg /f /q

REM Fin del script
exit /b
