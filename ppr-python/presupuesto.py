import registro_presupuesto

# ordenamos de manera descendente por puntos basado en búsqueda binaria
def add_in_order(reg, vector):
    n = len(vector)
    izq = 0
    der = n - 1
    pos = n
    while izq <= der:
        c = (izq + der) // 2
        if vector[c].importe == reg.importe:
            pos = c
            break
        if vector[c].importe < reg.importe:
            der = c - 1
        else:
            izq = c + 1

    if izq > der:
        pos = izq

    vector[pos:pos] = [reg]




def generar_vector():  # generamos vector con los datos
    vector = []
    i = 0
    cantidad = int(input(("Ingrese la cantidad de presupuestos: ")))
    while i < cantidad:
        nom = input("Ingrese el nombre del oferente: ")
        dia = int(input("Ingrese la cantidad de dias: "))
        imp = int(input("Ingrese el importe: "))
        reg = registro_presupuesto.Presupuesto(nom, dia, imp)
        # generamos el vector ordenado utilizando una función
        add_in_order(reg, vector)
        i += 1
    return vector


def mostrar_vector(vector):  # mostramos el vector
    for i in range(len(vector)):
        registro_presupuesto.to_string(vector[i])


def promedio(vector):
    suma = 0
    for i in range(len(vector)):
        suma += vector[i].importe
    return suma / len(vector)


def encontrar_menor(vector):
    menor = vector[0].importe
    nombre = vector[0].nombre
    for i in range(len(vector)):
        if vector[i].importe < menor:
            menor = vector[i].importe
            nombre = vector[i].nombre
    return nombre


def porcentaje_duracion_menor(vector):
    x = int(input("Ingrese la cantidad de dias de referencia: "))
    suma = 0
    for i in range(len(vector)):
        if vector[i].dias <= x:
            suma += 1
    return (suma // len(vector)) * 100


def principal():  # función principal con menú de opciones
    presupuestos = generar_vector()
    op = 1
    while op != 4:
        print(" ")
        print("-" * 100)
        print("{:>50}".format("-Menu de opciones-"))
        print("-" * 100)
        print("\n1-Mostrar listado de presupuestos")
        print("2-Presupuesto de importe menor")
        print("3-Porcentaje de presupuestos con duración menor a X dias")
        print("4-Salir")
        op = int(input("\nIngrese su opción: "))
        if op == 1:
            mostrar_vector(presupuestos)
        elif op == 2:
            print(encontrar_menor(presupuestos))
        elif op == 3:
            print(porcentaje_duracion_menor(presupuestos), "%")
        elif op == 4:
            print("Gracias por utilizar el programa!")
        else:
            print("Opción incorrecta, vuelva a intentar")


if __name__ == "__main__":
    principal()
