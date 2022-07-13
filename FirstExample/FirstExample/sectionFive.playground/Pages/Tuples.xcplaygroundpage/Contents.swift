import Foundation

//Tuples > We can have different data types into a tuple
var person = ("Juan", "Ochoa", 24, 1.69)
person.0 //To select the index of the tuple
var (name, lastName, age, height) = person //To asing the values of a tuple

var personNamedTuple = (name:"Juan", lastName:"Ochoa", age:24, height:1.69) //To asing keys to each item of a tuple
personNamedTuple.lastName
