import UIKit


//Protocol
protocol PersonProtocol {
    var name: String { get set } //Allows to get and set values to variable
    var age: Int { get set }
    
    func fullName() -> String
}

struct Programmer: PersonProtocol {
    var name: String
    var age: Int
    func fullName() -> String {
        return "El nombre es \(name) y su lenguaje favorito es \(language)"
    }
    var language: String
}

struct Teacher: PersonProtocol {
    var name: String
    var age: Int
    func fullName() -> String {
        return "El nombre es \(name) y su asignatura favorita es \(subject)"
    }
    var subject: String
}

let programmer = Programmer(name: "Juan", age:24, language: "Swift")
let teacher = Teacher(name: "Juan", age:24, subject: "Matematicas")

print (programmer.fullName())
print (teacher.fullName())


//protocol delegate >> It's use to make call backs asyncronous between classes.
class FirstClass: SecondClassProtocol {
    
    func call() {
        print ("Estoy de vuelta")
    }
    
    func callSecondClass() {
        let secondClass = SecondClass()
        secondClass.delegate = self
        secondClass.callFirst()
    }
}

protocol SecondClassProtocol {
    func call()
}

class SecondClass {
    var delegate: SecondClassProtocol?
    
    func callFirst() {
        sleep(10)
        delegate?.call()
    }
}

let firstClass = FirstClass()
firstClass.callSecondClass()
