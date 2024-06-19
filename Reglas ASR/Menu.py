def mostrar_menu():
    print("Bienvenido al menú:")
    print("1. Ejecutar regla ASR: Block Office application from creating child processes")
    print("2. Opción 2")
    print("3. Opción 3")
    # Agregar todas las opciones hasta la 38

def ejecutar_accion(opcion):
    if opcion == 1:
        print("Ejecutando regla ASR: Block Office application from creating child processes")
        # Aquí iría el código para ejecutar la regla iptables
    elif opcion == 2:
        print("Seleccionaste la opción 2")
        # Aquí iría la acción correspondiente para la opción 2
    elif opcion == 3:
        print("Seleccionaste la opción 3")
        # Y así sucesivamente para cada opción
    else:
        print("Opción no válida")

def main():
    mostrar_menu()
    opcion = int(input("Ingrese el número de la opción deseada: "))
    ejecutar_accion(opcion)

if __name__ == "__main__":
    main()
