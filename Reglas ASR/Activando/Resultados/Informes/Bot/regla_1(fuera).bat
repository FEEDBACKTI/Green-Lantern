@echo off

REM Cambiar el valor de MouseSpeed a 1 en el registro HKCU:\Control Panel\Mouse
reg add "HKCU\Control Panel\Mouse" /v rx /t REG_SZ /d 1 /f >nul

REM Verificar si el comando fue exitoso
if %errorlevel% equ 0 (
    echo Valor de rx cambiado a 1 correctamente.
    
    REM Obtener fecha y hora actual
    for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "DateTime=%%I"
    set "DateTime=%DateTime:~0,4%-%DateTime:~4,2%-%DateTime:~6,2% %DateTime:~8,2%:%DateTime:~10,2%:%DateTime:~12,2%"
    
    REM Registrar el cambio en el archivo de log
    echo Cambio de rx a 1 el %DateTime% >> "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\resultado_log.txt"
) else (
    echo Error al cambiar el valor de rx.
)

REM Fin del script
exit /b
