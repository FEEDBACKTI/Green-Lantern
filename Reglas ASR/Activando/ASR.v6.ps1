# Función para ejecutar diagnósticos de reglas ASR y registrar resultados en log
function EjecutarDiagnosticoASR {
    # Ruta donde se guardará el archivo de resultados
    $logfile = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\resultado_log.txt"
    # Ruta donde se guardará el informe en formato CSV
    $reportFile = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\Informes\informe.csv"

    # Inicio del mensaje de log con fecha y hora
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logfile -Value "Inicio del diagnostico ASR - $timestamp"

    # Ejecución de los diagnósticos de reglas ASR
    Write-Host "Ejecutando diagnosticos de reglas ASR..."
    try {
        # Ejecutar los diagnósticos de reglas ASR aquí
        # Por ejemplo, puedes utilizar comandos o scripts específicos de Windows para ejecutar ASR
        
        # Simulación de proceso de diagnóstico con Start-Sleep (puedes sustituir con el comando adecuado)
        Start-Sleep -Seconds 5
        
        # Fin de los diagnósticos
        Write-Host "Diagnostico completado."

        # Fin del mensaje de log con fecha y hora
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path $logfile -Value "Diagnostico ASR completado - $timestamp"

        # Generar informe detallado en pantalla basado en el archivo de log
        Write-Host "Generando informe detallado:"
        Get-Content -Path $logfile

        # Crear informe en formato CSV para base de datos en Control M
        Write-Host "Creando informe en formato CSV para Control M..."
        $logData = Get-Content -Path $logfile | ForEach-Object {
            [PSCustomObject]@{
                Timestamp = ($_ -split ' - ')[0]
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




#Add-MpPreference -AttackSurfaceReductionRules_Ids <rule ID> -AttackSurfaceReductionRules_Actions AuditMode666
# Función para buscar y ejecutar la regla basada en el ID
function EjecutarReglaPorID {
    param (
        [string]$id
    )

    # Directorio donde se encuentran los archivos de reglas (puedes ajustar esta ruta según tu estructura)
    $rutaDirectorio = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados"

    # Construir el nombre de archivo basado en el ID
    $nombreArchivo = "regla_$id.bat"
    $rutaCompleta = Join-Path -Path $rutaDirectorio -ChildPath $nombreArchivo

    # Verificar si el archivo existe
    if (Test-Path $rutaCompleta -PathType Leaf) {
        # Mostrar el contenido del archivo (aquí podrías ejecutar el contenido como un comando, dependiendo de tu implementación)
        Get-Content $rutaCompleta
    } else {
        Write-Host "La regla con ID $id no fue encontrada."
    }
}

# Función para mostrar el submenú de las 25 reglas de seguridad
function MostrarReglas {
    Clear-Host
    Write-Host "=================== Reglas de Seguridad Implementadas ==================="6
    Write-Host "`t1. "#Intento exitoso de cambio de configuración"
    Write-Host "`t2. "#Intento exitoso de activación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t3. "#Intento exitoso de activación de regla de reducción de superficie expuesta a ataques en modo de auditoría"
    Write-Host "`t4. "#Creación de nueva configuración"
    Write-Host "`t5. "#Intento exitoso de desactivación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t6. "#Intento exitoso de desactivación de regla de reducción de superficie expuesta a ataques en modo de auditoría"
    Write-Host "`t7. "#Eliminación de configuración"
    Write-Host "`t8. "#Creación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t9. "#Creación de regla de reducción de superficie expuesta a ataques en modo de auditoría"
    Write-Host "`t10. "#Modificación de configuración existente"
    Write-Host "`t11. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t12. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de auditoría"
    Write-Host "`t13. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t14. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t15. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t16. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t17. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t18. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t19. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t20. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t21. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t22. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t23. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t24. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t25. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t26. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t27. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"
    Write-Host "`t28. "#Eliminación de regla de reducción de superficie expuesta a ataques en modo de bloque"

    Write-Host "`n`t0. volver al Menu principal`n"
    Write-Host "========================================================================="

    do {
        $opcionRegla = Read-Host "Seleccione una regla para mas detalles (0 para volver)"
        switch ($opcionRegla) {
            0 { return }
            {$_ -match '^(5007|1121|1122|5008|1123|1124|5009|1125|1126|5010|1127|1128|5011|1129|1130|1131|5012|1132|1133|5013|1134|1135|5014|1136|1137)$'} {
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


# Menú principal
while ($true) {
    Clear-Host
    Write-Host "========================= Menu principal ==========================="
    Write-Host "`n`t1. Obtener Informacion"
    Write-Host "`t2. Ver reglas de seguridad"
    Write-Host "`t3. Ejecutar diagnostico de reglas ASR"
    Write-Host "`t4. Crear Informes`n"
    Write-Host "========================= Menu principal ==========================="
    $opcion = Read-Host "Seleccione la opcion y presione enter "

    switch ($opcion) {
        1 {
            # Lógica para obtener información
            break
        }
        2 {
            # Submenú para ver las reglas de seguridad
            MostrarReglas
            break
        }
        3 {
            # Llama a la función para ejecutar diagnóstico de reglas ASR
            EjecutarDiagnosticoASR
            break
        }
        4 {
            # Lógica para crear informes (no implementada en este ejemplo)
            Write-Host "Funcionalidad de creacion de informes no implementada."
            break
        }
        default {
            Write-Host "Opcion no valida. Por favor, seleccione una opcion valida."
            Start-Sleep -Seconds 2
            continue
        }
    }
}
