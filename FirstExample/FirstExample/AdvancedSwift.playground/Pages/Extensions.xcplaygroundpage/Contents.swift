import UIKit

let myMeters : Double = 5

func metersToKm(meters: Double) -> Double {
    return meters / 1000
}

print(metersToKm(meters: myMeters))

//It use to add funcionalities to datatypes.
extension Double {
    var km: Double {
        return self / 1000
    }
    
    var m: Double {
        return self
    }
    
    var cm: Double {
        return self * 100
    }
}

print(myMeters.cm)
