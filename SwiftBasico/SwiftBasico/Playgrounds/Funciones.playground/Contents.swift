import UIKit

var greeting = "Hello, playground"

print("Hola")

print("Hola", "Mundo", separator: "...")

func sumar(){
    print("El resultado es dos")
}

sumar()

func sumarXY(x:Int, y:Int){
    print(x + y)
}

sumarXY(x: 10, y: 20)

func sumarRetorno(numeroUno:Int, numeroDos:Int) -> Int{
    return numeroUno + numeroDos
}

var resultado = sumarRetorno(numeroUno: 23, numeroDos: 24)
print(resultado)

//Argument Labels
// Operador guion bajo
func saluda(_ destinatario:String, deParte remitente:String){
    print("Mando saludos a \(destinatario) de parte de \(remitente)")
}

saluda("Juan", deParte: "Jimmy")


