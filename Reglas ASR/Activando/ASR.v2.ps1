# Función para ejecutar una regla ASR desde un archivo autoejecutable
function EjecutarReglaASR {
    param (
        [string]$nombreRegla
    )

    # Ruta al archivo autoejecutable de la regla ASR
    $rutaArchivoASR = "C:\Rutas\al\Archivo\regla1.exe"  # Actualiza con la ruta correcta y nombre del archivo

    Clear-Host
    Write-Host "================ Ejecutando Regla ASR: $nombreRegla ================="
    Write-Host "Iniciando ejecución de la regla ASR..."
    
    # Verificar si el archivo existe
    if (Test-Path $rutaArchivoASR -PathType Leaf) {
        # Ejecutar el archivo autoejecutable
        Start-Process $rutaArchivoASR -NoNewWindow -Wait
        Write-Host "La regla ASR $nombreRegla se ha ejecutado correctamente."
    } else {
        Write-Host "Error: No se encontró el archivo autoejecutable para la regla ASR $nombreRegla."
    }

    Write-Host "`nPresione Enter para volver al submenu de reglas..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Función para mostrar el submenú de las 25 reglas de seguridad
function MostrarReglas {
    Clear-Host
    Write-Host "=================== Reglas de Seguridad Implementadas ==================="
    Write-Host "`n`t1. Restricción de ejecucio# Función para ejecutar diagnósticos de reglas ASR y registrar resultados en log
function EjecutarDiagnosticoASR {
    # Ruta donde se guardará el archivo de resultados
    $logfile = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\resultado_log.txt"
    # Ruta donde se guardará el informe en formato CSV
    $reportFile = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\Informes\informe.csv"

    # Inicio del mensaje de log con fecha y hora
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logfile -Value "Inicio del diagnóstico ASR - $timestamp"

    # Ejecución de los diagnósticos de reglas ASR
    Write-Host "Ejecutando diagnósticos de reglas ASR..."
    try {
        # Ejecutar los diagnósticos de reglas ASR aquí
        # Por ejemplo, puedes utilizar comandos o scripts específicos de Windows para ejecutar ASR
        
        # Simulación de proceso de diagnóstico con Start-Sleep (puedes sustituir con el comando adecuado)
        Start-Sleep -Seconds 5
        
        # Fin de los diagnósticos
        Write-Host "Diagnóstico completado."

        # Fin del mensaje de log con fecha y hora
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path $logfile -Value "Diagnóstico ASR completado - $timestamp"

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

        Write-Host "Informe generado correctamente: $reportFile"
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

# Función para mostrar el submenú de las 25 reglas de seguridad
function MostrarReglas {
    Clear-Host
    Write-Host "=================== Reglas de Seguridad Implementadas ==================="
    Write-Host "`n`t1. Restriccion de ejecucion de scripts no firmados"
    Write-Host "`t2. Control de ejecucion de aplicaciones basado en la lista blanca"
    Write-Host "`t3. Ejecutar diagnóstico de reglas ASR"  # Actualizada para incluir diagnóstico de ASR
    Write-Host "`t4. Ejemplo de otra regla de seguridad implementada"
    Write-Host "`t5. Ejemplo de otra regla de seguridad implementada"
    # Agregar todas las reglas de seguridad restantes aquí
    Write-Host "`n`t0. Volver al Menu principal`n"
    Write-Host "========================================================================="

    do {
        $opcionRegla = Read-Host "Seleccione una regla para mas detalles (0 para volver):"
        switch ($opcionRegla) {
            0 { return }
            1 {
                MostrarDetalleRegla "Restriccion de ejecucion de scripts no firmados"
                break
            }
            2 {
                MostrarDetalleRegla "Control de ejecucion de aplicaciones basado en la lista blanca"
                break
            }
            3 {
                # Llama a la función para ejecutar diagnóstico de reglas ASR
                EjecutarDiagnosticoASR
                break
            }
            4 {
                MostrarDetalleRegla "Ejemplo de otra regla de seguridad implementada"
                break
            }
            5 {
                MostrarDetalleRegla "Ejemplo de otra regla de seguridad implementada"
                break
            }
            # Agregar los casos para cada regla adicional según sea necesario
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
            # Logica para obtener informacion
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
            Write-Host "Funcionalidad de creación de informes no implementada."
            break
        }
        default {
            Write-Host "Opcion no valida. Por favor, seleccione una opcion valida."
            Start-Sleep -Seconds 2
            continue
        }
    }
}
n de scripts no firmados"
    Write-Host "`t2. Control de ejecucion de aplicaciones basado en la lista blanca"
    Write-Host "`t3. Ejecutar regla ASR desde archivo autoejecutable"
    Write-Host "`t4. Ejemplo de otra regla de seguridad implementada"
    Write-Host "`t5. Ejemplo de otra regla de seguridad implementada"
    # Agregar todas las reglas de seguridad restantes aquí
    Write-Host "`n`t0. Volver al Menu principal`n"
    Write-Host "========================================================================="

    do {
        $opcionRegla = Read-Host "Seleccione una regla para más detalles (0 para volver):"
        switch ($opcionRegla) {
            0 { return }
            1 {
                MostrarDetalleRegla "Restricción de ejecución de scripts no firmados"
                break
            }
            2 {
                MostrarDetalleRegla "Control de ejecución de aplicaciones basado en la lista blanca"
                break
            }
            3 {
                EjecutarReglaASR "Regla ASR desde archivo autoejecutable"
                break
            }
            4 {
                MostrarDetalleRegla "Ejemplo de otra regla de seguridad implementada"
                break
            }
            5 {
                MostrarDetalleRegla "Ejemplo de otra regla de seguridad implementada"
                break
            }
            # Agregar los casos para cada regla adicional según sea necesario
            default {
                Write-Host "Opción no válida. Por favor, seleccione una opción válida."
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
    Write-Host "`t3. Ejecutar diagnostico"
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
            # Lógica para ejecutar diagnósticos (aquí podrías agregar más funcionalidad si es necesario)
            Write-Host "Ejecutando diagnosticos..."
            Start-Sleep -Seconds 2
            Write-Host "Diagnostico completado."
            break
        }
        4 {
            # Lógica para crear informes
            break
        }
        default {
            Write-Host "Opcion no valida. Por favor, seleccione una opcion valida."
            Start-Sleep -Seconds 2
            continue
        }
    }
}