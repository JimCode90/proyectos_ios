import UIKit

var greeting = "Hello, playground"

struct calculadora {
    var numeroUno:Int
    var numeroDos:Int
    
    init(){
        numeroUno = 10
        numeroDos = 20
    }
    
    func suma() -> Int{
        return numeroUno + numeroDos
    }
    
    func multiplicacion(numeroUno:Int, numeroDos:Int) -> Int {
        return self.numeroUno * self.numeroDos
    }
}

var instanciaSuma = calculadora()
print(instanciaSuma.numeroUno)
print(instanciaSuma.numeroDos)
instanciaSuma.numeroUno = 4
instanciaSuma.numeroDos = 8
print(instanciaSuma.numeroUno)
print(instanciaSuma.numeroDos)

var instanciaSumaDos = instanciaSuma
print(instanciaSumaDos.numeroUno)
print(instanciaSumaDos.numeroDos)

instanciaSuma.numeroUno = 5
instanciaSuma.numeroDos = 7
print(instanciaSuma.numeroUno)
print(instanciaSuma.numeroDos)

print(instanciaSumaDos.numeroUno)
print(instanciaSumaDos.numeroDos)
