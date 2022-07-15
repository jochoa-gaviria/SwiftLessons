import Foundation

var age = 20
var money = 1000
var isWoman = false

if (age >= 18 || money > 250)  && isWoman {
    print("Puedes entrar al bar, eres mayor de edad")
}
else {
    print("No puedes entrar al bar, eres menor de edad")
}


//Switch

let country = "CO"

switch country {
    case "ES":
        print("español")
    case "MX":
        print("español")
    case "PE":
        print("español")
    case "CO":
        print("español")
    case "EEUU":
        print("ingles")
    default:
        print("Idioma desconocido")
}


switch age {
    case 0,1,3:
        print("Bebe")
    case 3...10:
        print("niño")
    case 11..<16:
        print("adolecente")
    case 16..<70:
        print("adulto")
    case 70..<100:
        print("anciano")
    default:
        print("😨")
}


enum PersonalData {
    case name
    case surname
    case address
    case phone
}

let userData:PersonalData = .name

switch userData {
case .name:
    print("Nombre")
case .surname:
    print("Apellido")
case .address:
    print("Direccion")
case .phone:
    print("Telefono")
}

