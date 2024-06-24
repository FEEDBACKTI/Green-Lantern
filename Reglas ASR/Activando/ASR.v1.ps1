# Función para ejecutar una regla ASR desde un archivo autoejecutable
function EjecutarReglaASR {
    param (
        [string]$nombreRegla
    )

    # Ruta al archivo autoejecutable de la regla ASR
    $rutaArchivoASR = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\regla1.bat"  # Actualiza con la ruta correcta y nombre del archivo

    Clear-Host
    Write-Host "================ Ejecutando Regla ASR: $nombre1 ================="
    Write-Host "Iniciando ejecucion de la regla ASR..."
    
    # Verificar si el archivo existe
    if (Test-Path $rutaArchivoASR -PathType Leaf) {
        # Ejecutar el archivo autoejecutable
        Start-Process $rutaArchivoASR -NoNewWindow -Wait 
        Write-Host "La regla ASR $nombre1 se ha ejecutado correctamente."
    } else {
        Write-Host "Error: No se encontro el archivo autoejecutable para la regla ASR $nombreRegla."
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
    Write-Host "`t3. Ejecutar regla ASR desde archivo autoejecutable"
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
    Write-Host "`t3. Ejecutar diagnostico"
    Write-Host "`t4. Crear Informes`n"
    Write-Host "========================= Menu principal ==========================="
    $opcion = Read-Host "Seleccione la opcion y presione enter"

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