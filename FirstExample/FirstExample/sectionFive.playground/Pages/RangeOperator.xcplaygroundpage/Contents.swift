import Foundation


var exampleArray = [0,11,22,33,44,55,66,77,88,99]

//Two-sided range operator
var subSetArray = exampleArray[0...2]
var subSetArrayLessThan = exampleArray[0..<2]


//One-sided range operator
var subSetInitialIndex = exampleArray[5...]
var subSetFinalIndex = exampleArray[...3]

//Define closeRange
var closeRange = 1...5
var closeRangeArray = Array(closeRange)
var closeRangeExample = exampleArray[closeRange]
