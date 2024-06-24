# Funcion para ejecutar diagnosticos de reglas ASR y registrar resultados en log
function EjecutarDiagnosticoASR {
    # Ruta donde se guardara el archivo de resultados
    $logfile = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\resultado_log.txt"
    # Ruta donde se guardara el informe en formato CSV
    $reportFile = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\Informes\informe.csv"

    # Inicio del mensaje de log con fecha y hora
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logfile -Value "diagnostico ASR - $timestamp"

    # Ejecucion de los diagnosticos de reglas ASR
    Write-Host "Ejecutando..."
    try {
        # Ejecutar los diagnosticos de reglas ASR aqui
        # Por ejemplo, puedes utilizar comandos o scripts especificos de Windows para ejecutar ASR
        
        # Simulacion de proceso de diagnostico con Start-Sleep (puedes sustituir con el comando adecuado)
        Start-Sleep -Seconds 5
        
        # Fin de los diagnosticos
        Write-Host "Diagnostico completado."

        # Fin del mensaje de log con fecha y hora
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path $logfile -Value "Diagnostico ASR completado - $timestamp"

        # Generar informe detallado en pantalla basado en el archivo de log
        Write-Host "Generando informe detallado:"
        Get-Content -Path $logfile

        # Crear informe en formato CSV 
        Write-Host "Creando informe "
        $logData = Get-Content -Path $logfile | ForEach-Object {
            [PSCustomObject]@{
                Timestamp = ($_ -split ' - ')[0]
                ########################################
                Message = ($_ -split ' - ')[1]
            }
        }
        $logData | Export-Csv -Path $reportFile -NoTypeInformation -Encoding UTF8

        Write-Host "Informe CSV generado correctamente: $reportFile"
    }
    catch {
        Write-Host "Error al ejecutar diagnosticos de reglas ASR: $_"
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path $logfile -Value "Error al ejecutar diagnosticos de reglas ASR - $timestamp"
    }
    finally {
        Write-Host "Proceso de diagnostico finalizado."
    }

    Write-Host "`nPresione Enter para volver al submenu de reglas..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Funcion para buscar y ejecutar la regla basada en el ID
function EjecutarReglaPorID {
    param (
        [string]$id
    )

    # Directorio donde se encuentran los archivos de reglas (puedes ajustar esta ruta segun tu estructura)
    $rutaDirectorio = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\reglas"

    # Construir el nombre de archivo basado en el ID
    $nombreArchivo = "regla_$id.bat"
    $rutaCompleta = Join-Path -Path $rutaDirectorio -ChildPath $nombreArchivo

    # Verificar si el archivo existe
    if (Test-Path $rutaCompleta -PathType Leaf) {
        # Mostrar el contenido del archivo (aqui podrias ejecutar el contenido como un comando, dependiendo de tu implementacion)
        Get-Content $rutaCompleta
    } else {
        Write-Host "La regla con ID $id no fue encontrada."
    }
}

# Funcion para mostrar el submenu de las 25 reglas de seguridad
function MostrarReglas {
    Clear-Host
    Write-Host "=================== Reglas de Seguridad Implementadas ==================="
    Write-Host "`t1. "#x1"
    Write-Host "`t2. "#x2"
    Write-Host "`t3. "#x3"
    Write-Host "`t4. "#x4"
    Write-Host "`t5. "#x5"
    Write-Host "`t6. "#x6"
    Write-Host "`t7. "#x7"
    Write-Host "`t8. "#x8"
    Write-Host "`t9. "#x9"
    Write-Host "`t10. "#x10"
    Write-Host "`t11. "#x11"
    Write-Host "`t12. "#x12"
    Write-Host "`t13. "#x13"
    Write-Host "`t14. "#x14"
    Write-Host "`t15. "#x15"
    Write-Host "`t16. "#x16"
    Write-Host "`t17. "#x17"
    Write-Host "`t18. "#x18"
    Write-Host "`t19. "#x19"
    Write-Host "`t20. "#x20"
    Write-Host "`t21. "#x21"
    Write-Host "`t22. "#x22
    Write-Host "`t23. "#x23
    Write-Host "`t24. "#x24
    Write-Host "`t25. "#x25"
    Write-Host "`n`t0. Volver al Menu principal`n"
    Write-Host "========================================================================="

    do {
        $opcionRegla = Read-Host "Seleccione una regla para mas detalles (0 para volver)"
        switch ($opcionRegla) {
            0 { return }
            {$_ -match '^(1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25)$'} {
                EjecutarReglaPorID $_
                break
            }
            default {
                Write-Host "Opcion no valida. Por favor, seleccione una opcion valida."
                Start-Sleep -Seconds 2
            }
        }
    } while ($true)
}

# Menu principal
while ($true) {
    Clear-Host
    Write-Host "========================= Menu principal ==========================="
    Write-Host "`n`t1. Obtener Informacion"
    Write-Host "`t2. Ver reglas de seguridad"
    Write-Host "`t3. Ejecutar diagnostico de reglas ASR"
    Write-Host "`t4. Crear Informes`n"
    Write-Host "========================= Menu principal ==========================="
    $opcion = Read-Host "Seleccione la opcion y presione enter "
    $reportFile = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\Informes\informe.csv"

    switch ($opcion) {
        1 {
            # Logica para obtener informacion
            break
        }
        2 {
            # Submenu para ver las reglas de seguridad
            MostrarReglas
            break
        }
        3 {
            # Llama a la funcion para ejecutar diagnostico de reglas ASR
            EjecutarDiagnosticoASR
            break
        }
        4 {
            # Logica para crear informes

                    # Lógica para crear informes
                    Write-Host "`nContenido del archivo informe.csv:`n"
                    Get-Content -Path $reportFile
                    Write-Host "`nPresione Enter para volver al Menú principal..."
                    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                    break
                }

        default {
            Write-Host "Opcion no valida. Por favor, seleccione una opcion valida."
            Start-Sleep -Seconds 2
            break
        }
    }
}
