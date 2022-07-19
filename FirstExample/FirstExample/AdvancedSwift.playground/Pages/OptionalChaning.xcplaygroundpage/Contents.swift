import Foundation

class Student {
    var name: String?
    var book: Book?
}

class Book {
    var pages: Int?
}

let myStudent = Student()

myStudent.name = "Juan"
let myBook = Book()
myBook.pages = 123
myStudent.book = myBook


//chaning bindings

if let pages = myStudent.book?.pages, let name = myStudent.name {
    print ("El libro de \(name) tiene \(pages) paginas")
} else {
    print ("El libro no tiene paginas")
}
