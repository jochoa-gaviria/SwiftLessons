import Foundation

//Classes uses references for objects we created.
class car {
    var color = "neutro"
    var weels = 4
    var cost = 0
    
    func turnOn() -> Bool {
        return true
    }
    
    func turnOff() -> Bool {
        return true
    }
}


var mazda = car()

mazda.cost = 10000
print(mazda.cost)
print(mazda.turnOn())
