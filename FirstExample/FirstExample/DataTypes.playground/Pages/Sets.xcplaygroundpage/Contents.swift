import Foundation

//Sets > Disorder, each item is unique

var mySet = Set<String>()
let mySet2: Set<String> = ["Juan", "David", "24", "Juan"] //Juan won't be repeat into the set.

//Add item to set
mySet.insert("Juan")
mySet.insert("24")
print(mySet)

//Access

if mySet.contains("24"){
    print("Existe")
} else {
    print("No existe")
}

//Access and update/delete by index

if let index = mySet.firstIndex(of: "Juan"){
    mySet.remove(at: index)
}
print(mySet)


//iterate sets

for myElement in mySet2 {
    print(myElement)
}

//Opetations

let myIntSet: Set<Int> = [1,2,3,4,5,6]
let myIntSet2: Set<Int> = [0,2,4,7]

//-Intersection
print(myIntSet.intersection(myIntSet2))

//-Symmetric diff
print(myIntSet.symmetricDifference(myIntSet2))

//-Union
print(myIntSet.union(myIntSet2))

//-Subtracting
print(myIntSet.subtracting(myIntSet2))
