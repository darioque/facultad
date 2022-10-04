class Presupuesto:
    def __init__(self, nom, dia, imp):
        self.nombre = nom
        self.dias = dia
        self.importe = imp

def to_string(presupuesto):
    r = ""
    r += "{:<20}".format(" Nombre del oferente: " + presupuesto.nombre + "\n")
    r += "{:<20}".format(" Cantidad de dias: " + str(presupuesto.dias) + "\n")
    r += "{:<20}".format(" Importe: " + str(presupuesto.importe))
    print("-" * 122)
    print(r)
