import Foundation

let myString = "Juan"
let myInt = 24

class MyClass {
    var name: String!
    var age: Int! // '!' > it use to specify that the value is required.
}

let myClass = MyClass()
myClass.name = "Juan David"
myClass.age = 24

let myArray: [Any] = [myString, myInt, myClass]

for item in myArray {
    // Type Casting >> word 'is'
    if item is String {
        let myItemString = item as! String // 'as' is use to downcasting > convert into a specific data type, '!' is use to force the downcasting.
        print ("Item es de tipo String y tiene el valor \(myItemString)")
    } else if item is Int {
        let myItemInt = item as! Int
        print ("Item es de tipo Int y tiene el valor \(myItemInt)")
    } else if item is MyClass {
        let myItemMyClass = item as! MyClass
        print ("Item es de tipo MyClass y tiene el valor: \(myItemMyClass.name!) y \(myItemMyClass.age!)")
    }
}


for item in myArray {
    if let myItemString = item as? String { //using 'as?' as a optional value it's an easy way to do type casting and downcasting simultaneusly.
        print ("Item es de tipo String y tiene el valor \(myItemString)")
    } else if let myItemInt = item as? Int {
        print ("Item es de tipo Int y tiene el valor \(myItemInt)")
    } else if let myItemMyClass = item as? MyClass {
        print ("Item es de tipo MyClass y tiene el valor: \(myItemMyClass.name!) y \(myItemMyClass.age!)")
    }
}
