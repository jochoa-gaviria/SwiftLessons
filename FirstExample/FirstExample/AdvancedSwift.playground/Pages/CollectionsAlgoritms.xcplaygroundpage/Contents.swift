import UIKit

var myArray: [Int] = [5,8,1,0,3,9,7,2,4,6]

let myDictionary: [Int:String] = [5:"Five",
                                  8:"Eight",
                                  1:"One",
                                  0:"Zero",
                                  3:"Three",
                                  9:"Nine",
                                  7:"Seven",
                                  2:"Two",
                                  4:"Four",
                                  6:"Six"]

let mySet: Set<Int> = [5,8,1,0,3,9,7,2,4,6]

//Sort (Order)
print("\nSort (Order) \n")
//Dict and sets no suppots Sort Algoritms
print(myArray)
myArray.sort()
print(myArray)

//Sort customized
print ("\nSort customized \n")
myArray.sort(by:{ (intA, intB) -> Bool in
    return intA > intB
})
print(myArray)

//Sorted >> This algoritm don't modify the orinal collection. It returns a new collection
print("\nSorted >> This algoritm don't modify the orinal collection. It returns a new collection \n")
var myArraySorted = myArray.sorted()
print(myArraySorted)
myArraySorted = myArray.sorted(by:{ (intA, intB) -> Bool in
    return intA > intB
})
print(myArraySorted)

//When we order a dictionary with sorted, the function returns an array of tuples with key and value
print("\nWhen we order a dictionary with sorted, the function returns an array of tuples with key and value \n")
print (myDictionary)
var myDictionarySorted = myDictionary.sorted(by: { (elementA, elementB) -> Bool in
    return elementA < elementB
})
print (myDictionarySorted)

//When we order a set we get an array sorted.
print("\nWhen we order a set we get an array sorted. \n")
print(mySet)
var mySetSorted = mySet.sorted()
print(mySetSorted)
//We can customize the sorted
print("\nWe can customize the sorted \n")
mySetSorted = mySet.sorted(by: { (intA, intB) -> Bool in
    return intA > intB
})
print(mySetSorted)

//Map function
print("\nMap function \n")
print(myArray)
var intMapArray = myArray.map { (myInt) -> Int in
    return myInt + 10
}
print(intMapArray)
var stringMapArray = myArray.map { (myInt) -> String in
    return "This is my number \(myInt)"
}
print(stringMapArray)

//Map to a dictionary
print("\nMap to a dictionary \n")
intMapArray = myDictionary.map { (myElement) -> Int in
    return myElement.key
}
print(intMapArray)

//Map to a set
print("\nMap to a set \n")
stringMapArray = mySet.map { (myInt) -> String in
    return "\(myInt)"
}
print(stringMapArray)


//Foreach
print("\nForEach array\n")
myArray.forEach { (myInt) in
    print(myInt)
}
print("\nForEach dictionary \n")
myDictionary.forEach { (myElement) in
    print(myElement)
}
print("\nForEach set\n")
mySet.forEach { (myInt) in
    print(myInt)
}


//Count
print("\n count operation \n")
print(myArray.count)
print(myDictionary.count)
print(mySet.count)

//isEmpty operation
print("\nisEmpty operation \n")
print(myArray.isEmpty)
print(myDictionary.isEmpty)
print(mySet.isEmpty)

//reversed operation
print("\n Reversed operation \n")
print(myArray.reversed() as [Int]) //for array is necessary specify the return value: as [Int] or ReversedCollection
print(myDictionary.reversed())
print(mySet.reversed())

//First and Last Operations
print("\n First and Last Operations \n")
print(myArray.first!)
print(myArray.last!)
print(myDictionary.first!)
print(mySet.first!)
