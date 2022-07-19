import UIKit

let strNumber = "100"
let intNumber = Int(strNumber)

let strWrongNumber = "Juan"
let intWrongNumber:Int? = Int(strWrongNumber) //Optional Int


var myOptionalString: String?
print(myOptionalString as Any)

if myOptionalString != nil {
    print("Nuestra variable no es nula")
} else {
    print("Nuestra variable es nula")
}


