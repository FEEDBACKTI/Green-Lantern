# Función para ejecutar diagnósticos de reglas ASR y registrar resultados en log
function EjecutarDiagnosticoASR {
    # Definición de rutas de archivos
    $logfile = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\resultado_log.txt"
    $reportFile = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\Informes\informe.csv"

    # Inicio del mensaje de log con fecha y hora
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logfile -Value "diagnostico ASR - $timestamp"

    # Ejecución de los diagnósticos de reglas ASR
    Write-Host "Ejecutando regla ASR..."
    try {
        # Simulación de proceso de diagnóstico (ejemplo: Start-Sleep -Seconds 5)
        Start-Sleep -Seconds 5
        
        # Fin de los diagnósticos
        Write-Host "Diagnóstico completado."

        # Registro en el log con fecha y hora
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
    }
    catch {
        Write-Host "Error al ejecutar diagnósticos de reglas ASR: $_"
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Add-Content -Path $logfile -Value "Error al ejecutar diagnósticos de reglas ASR - $timestamp"
    }
    finally {
        Write-Host "Proceso de diagnóstico finalizado."
    }

    # Esperar que el usuario presione Enter para volver al submenu de reglas
    Write-Host "`nPresione Enter para volver al submenu de reglas..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Función para buscar y ejecutar la regla basada en el ID
function EjecutarReglaPorID {
    param (
        [string]$id
    )

    # Directorio donde se encuentran los archivos de reglas
    $rutaDirectorio = "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Resultados\reglas"

    # Construir la ruta completa del archivo basado en el ID
    $rutaCompleta = Join-Path -Path $rutaDirectorio -ChildPath "regla_$id.bat"

    # Verificar si el archivo existe
    if (Test-Path $rutaCompleta -PathType Leaf) {
        # Mostrar el contenido del archivo
        Get-Content $rutaCompleta
    } else {
        Write-Host "La regla con ID $id no fue encontrada."
    }
}

# Función para mostrar el submenu de las 25 reglas de seguridad
function MostrarReglas {
    Clear-Host
    Write-Host "=================== Reglas de Seguridad Implementadas ==================="
    # Mostrar opciones de reglas (1 a 25) y opción 0 para volver al menú principal
    1..25 | ForEach-Object {
        Write-Host "`t$_."
    }
    Write-Host "`n`t0. Volver al Menu principal`n"
    Write-Host "========================================================================="

    # Bucle para que el usuario seleccione una regla o 0 para salir
    do {
        $opcionRegla = Read-Host "Seleccione una regla para más detalles (0 para volver)"
        switch ($opcionRegla) {
            0 { return }
            {$_ -match '^\d+$' -and $_ -ge 1 -and $_ -le 25} {
                EjecutarReglaPorID $_
                break
            }
            default {
                Write-Host "Opción no válida. Por favor, seleccione una opción válida."
                Start-Sleep -Seconds 2
            }
        }
    } while ($true)
}

# Menu principal
while ($true) {
    Clear-Host
    Write-Host "========================= Menu principal ==========================="
    Write-Host "`n`t1. Obtener Información"
    Write-Host "`t2. Ver reglas de seguridad"
    Write-Host "`t3. Ejecutar diagnóstico de reglas ASR"
    Write-Host "`t4. Crear Informes`n"
    Write-Host "========================= Menu principal ==========================="
    
    # Leer la opción seleccionada por el usuario
    $opcion = Read-Host "Seleccione la opción y presione enter "

    # Evaluar la opción seleccionada y ejecutar la función correspondiente
    switch ($opcion) {
        1 {
            Clear-Host
            Write-Host "======================= Obtener Información ========================"
            # Mostrar el contenido del archivo menu.txt
            Get-Content "C:\Users\psand\OneDrive\Documentos\doc\Reglas ASR\Activando\Menu\menu.txt"
            Write-Host "`n==================================================================="
            Write-Host "`nPresione cualquier tecla para volver al menú principal..."
            $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
            break
        }
        2 {
            # Submenu para ver las reglas de seguridad
            MostrarReglas
            break
        }
        3 {
            # Llamar a la función para ejecutar diagnóstico de reglas ASR
            EjecutarDiagnosticoASR
            break
        }
        4 {
            # Mostrar opción para crear informes (ya implementada en EjecutarDiagnosticoASR)
            EjecutarDiagnosticoASR
            break
        }
        default {
            Write-Host "Opción no válida. Por favor, seleccione una opción válida."
            Start-Sleep -Seconds 2
            break
        }
    }
}
