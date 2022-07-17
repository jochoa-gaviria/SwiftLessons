import UIKit


func myFunction(){
    print("Print into a function")
}

myFunction()


func sumNumbersFunc(){
    let firstNumber:Int = 5
    let secondNumber:Int = 10
    print(firstNumber+secondNumber)
}

sumNumbersFunc()


func squareNumber(x:Int){
    let squareNumber = x * x
    print(squareNumber)
}

squareNumber(x:10)


func squareNumberWithReturnValue(x:Int) -> Int {
    return x * x
}
_ = squareNumberWithReturnValue(x:4) //To call a function with return but the return value doesn't matters
let squareResult = squareNumberWithReturnValue(x:5)
print(squareResult)


func helloToSomebody(name:String, message:String = "Bienvenido"){
    print("Hola, \(name) \(message)")
}

helloToSomebody(name:"Maria", message:"Te damos la bienvenido...")
helloToSomebody(name:"Pedro")

func nameList () -> [String]{
    let names = ["Jose", "Maria", "Juan"]
    return names
}

print(nameList())


//Parameter's names internal and externals
//function - externalName internalName
func average(firstCourse courseOne:Double, secondCourse courseTwo:Double, thirdCourse courseThree:Double) -> Double{
    return (courseOne + courseTwo + courseThree)/3
}

print(average(firstCourse: 4, secondCourse: 5, thirdCourse: 3))
