import Foundation

//Throws is use for error handling
func sum(firstNumber: Int?, secondNumber: Int?) throws -> Int {
    if firstNumber == nil {
        throw SumError.firstNumberNil
    } else if secondNumber == nil {
        throw SumError.secondNumberNil
    } else if firstNumber! < 0 || secondNumber! < 0 {
        throw SumError.numberNegative(firstNumber: firstNumber!, secondNumber: secondNumber!)
    }
    
    return firstNumber! + secondNumber! //Force unpacking
}

enum SumError: Error {
    case firstNumberNil
    case secondNumberNil
    case numberNegative(firstNumber: Int, secondNumber: Int)
}


//This way represents a try catch
do {
    print(try sum(firstNumber:100, secondNumber:10))
} catch SumError.firstNumberNil {
    print("El primer numero es nulo")
} catch SumError.secondNumberNil {
    print("El segundo numero es nulo")
} catch SumError.numberNegative(let firstNumber, let secondNumber) {
    print("Hay algun numero negativo: \(firstNumber), \(secondNumber)")
}

