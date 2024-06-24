# Menú principal
while ($true) {
    Clear-Host
    Write-Host "=========================Menu principal============================="
    Write-Host "`n`t1. Obtener Informaci0n"
    Write-Host "`t2. Cambiar configuraci0n"
    Write-Host "`t3. Ejecutar diagn0sticos"
    Write-Host "`t4. Crear Informes`n"
    Write-Host "========================Menu principal============================="
    $opcion = Read-Host "Seleccione la opci0n y presione enter:"

    switch ($opcion) {
        1 {
            # Lógica para obtener información
            break
        }
        2 {
            # Lógica para cambiar configuración
            break
        }
        3 {
            # Lógica para ejecutar diagnósticos
            break
        }
        4 {
            # Lógica para crear informes
            break
        }
        default {
            Write-Host "Opción no válida. Por favor, seleccione una opción válida."
            Start-Sleep -Seconds 2
            continue
        }
    }
}
