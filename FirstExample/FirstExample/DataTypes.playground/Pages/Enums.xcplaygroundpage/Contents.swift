import Foundation

//Enums >> To get define data
enum personalData {
    case name
    case surname
    case address
    case phone
}

var currentData:personalData = .name

enum complexPersonalData {
    case name(String)
    case surname(String, String)
    case address(String, Int)
    case phone(Int)
}

var complexCurrentData: complexPersonalData = .name("Juan")
complexCurrentData = .address("Calle", 10)

enum rawPersonalData:String {
    case name = "Nombre" //To asing default value
    case surname = "Apellido"
    case address = "Direccion"
    case phone = "Telefono"
}

rawPersonalData.phone.rawValue
