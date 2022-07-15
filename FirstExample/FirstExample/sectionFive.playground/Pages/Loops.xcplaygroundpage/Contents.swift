import Foundation

//For loop
var counter:Int = 0

for num in 1...4 {
    counter += 1
    print(num)
}

var countries = ["CO", "MX", "CH"]

for country in countries {
    print(country)
}

var countriesDict = ["CO":"Colombia", "MX":"Mexico", "CH":"Chile"]
for coutry in countriesDict{
    print(coutry.value)
}

for (country, countryName)  in countriesDict{
    print("\(country) - \(countryName)")
}


var numbers:[Int] = [1,2,3,4,5,6,7,8]
var sum:Int = 0

for number in numbers {
    sum += number
}

//While loop

var age = 10

while age < 18 {
    print ("eres menor de edad. Te falta \(18-age) años")
    age += 1
}
print ("Eres mayor de edad")


// Repeat while loop
var i = numbers.count-1

repeat {
    numbers.remove(at: i)
    i -= 1
}while(numbers.count > 0)
print("numbers now has \(numbers.count) items")


var ramdomNumber:Int
var n = 0
repeat{
    n += 1
    ramdomNumber = Int(arc4random_uniform(50))
    print ("The loop has \(n) iterations")
}while(ramdomNumber != 8)
