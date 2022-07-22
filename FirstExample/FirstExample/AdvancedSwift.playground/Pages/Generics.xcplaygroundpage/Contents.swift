import UIKit

//inout is a output parameters
//Without generics
func swapTwoInts(a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var myFirstInt = 5
var mySecondInt = 10
print ("El primer valor es: \(myFirstInt) y el segundo valor es \(mySecondInt)")
//We need to putin '&' when the function has an output parameter
swapTwoInts(a: &myFirstInt, b: &mySecondInt)
print ("El primer valor es: \(myFirstInt) y el segundo valor es \(mySecondInt)")

//With generics
func swapTwoGenerics<T>(a: inout T, b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var myFirstGeneric = "Juan"
var mySecondGeneric = "David"
print ("El primer valor es: \(myFirstGeneric) y el segundo valor es \(mySecondGeneric)")
//We need to putin '&' when the function has an output parameter
swapTwoGenerics(a: &myFirstGeneric, b: &mySecondGeneric)
print ("El primer valor es: \(myFirstGeneric) y el segundo valor es \(mySecondGeneric)")

//Generics can be a delimited type by a class or protocol, for example
//func swapTwoGenerics<T : SomeClass, U: SomeProtocol>(a: inout T, b: inout T, c: U) {
//}


//Access control
// open - public >> it can be access for all modules
// internal >> only can be access by the local module
// fileprivate >> it can be access only by the local file
// private >> only can be access by the context when it is created
