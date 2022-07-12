import Foundation

//Comparation
let name1 = "Juan"
let name2 = "David"
let name3 = "Juan"

name1 == name2
name1 == name3


//Contains operations
let myContent = "My name is Juan"
myContent.contains(name1)


//Empty operation
let myEmptyString = String()

myEmptyString == String()
myEmptyString == ""
myEmptyString.isEmpty

//Loops
for valor in myContent {
    print(valor)
}
