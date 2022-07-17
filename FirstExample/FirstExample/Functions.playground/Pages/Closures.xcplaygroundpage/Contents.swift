import Foundation

let myFirstClosure = {
    (courseOne:Double, courseTwo:Double, courseThree:Double) -> Double in
    return (courseOne + courseTwo + courseThree)/3
}

print(myFirstClosure(5, 3, 2))
