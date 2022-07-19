import Foundation

var myOptionalString: String?

func myFunction()
{
    guard let myString = myOptionalString else {  // Force a return or throw exception when the values are null.
        print ("myString is null")
        return
    }
    print ("El valor de myString es \(myString)")
}

myFunction()
myOptionalString = "Cool"
myFunction()
