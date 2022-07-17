import Foundation

//Dictionaries > (Key, Value) > each key is unique
let myClassicDictionary = Dictionary<Int, String>()
var myModernDictionary = [Int:String]()

myModernDictionary = [001:"Juan", 002:"David"] //To add items
myModernDictionary[003] = "Daniela" //To add a single item

myModernDictionary[001] //To access an item

myModernDictionary[003] = "Erika Daniela" //To update item
myModernDictionary.updateValue("Juan Ochoa", forKey: 001) //To update item classic mode

myModernDictionary[002] = nil // To remove
myModernDictionary.removeValue(forKey: 003) //To remove an item, classic mode
