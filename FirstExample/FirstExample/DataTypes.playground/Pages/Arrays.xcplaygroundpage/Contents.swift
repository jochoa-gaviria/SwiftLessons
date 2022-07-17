import Foundation

var greeting = "Hello, playground"

//Arrays > Order
var numArray = [1,2,3]
let numArrayConstant = [3,2,1]

numArray.append(5) // add at the end of the array
numArray.insert(4, at: 3) //To insert in an specific index
print(numArray)

numArray.removeLast() //To remove the last item
numArray.remove(at: 3) //Remove item in specific index
print(numArray)

var emptyArray:[Int] = []
print(emptyArray)
