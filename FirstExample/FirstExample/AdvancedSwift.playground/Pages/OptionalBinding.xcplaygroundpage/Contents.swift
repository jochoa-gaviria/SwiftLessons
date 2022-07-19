import Foundation

var myOptionalString: String?
var myOptionalString2: String?

myOptionalString = "Juan"
myOptionalString2 = "David"

if let myString = myOptionalString, let myString2 = myOptionalString2{
    print("\(myString) - \(myString2)") //Only is executed when variable is not null, It can have n variables
} else {
    print("Alguna variable es nula")
}


//force unpack - not recommended
var myOptionalString3: String?
myOptionalString3 = "Force"
print(myOptionalString3!) //The app will crash when the value is null
var myOptionalString4:String?

//as Any avoid the application crashed when the value is null
print(myOptionalString4 as Any)
