import UIKit

//Structs uses a copy in memory for each instance
struct squares {
    var length = 10
    var height = 10
    
    func area() -> Int {
        return length*height
    }
}

var mySquare = squares()

print(mySquare.length)
print(mySquare.area())
