import subprocess

def ejecutar_accion(opcion):
    if opcion == 1:
        print("Ejecutando regla ASR: Block Office application from creating child processes")
        # Ejemplo de ejecución de un comando de iptables
        subprocess.run(["iptables", "-A", "INPUT", "-s", "192.168.1.0/24", "-j", "DROP"])
