//
//  CarDetailViewController.swift
//  carsFactory
//
//  Created by Juan on 13/12/22.
//

import UIKit

class CarDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var InformationLabel: UILabel!
    
    var type: Cars?
    
    enum Cars{
        case simpleCar
        case electricCar
    }
    
    var simpleCar: Car?
    var electricCar: ElectricCar?
    var IsCarTurnOn: Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch (type){
        case .simpleCar:
            simpleCar = Car()
            simpleCar?.color = "Negro"
            InformationLabel.text = "It was created a simple car"
        case .electricCar:
            electricCar = ElectricCar()
            electricCar?.price = 10000
            InformationLabel.text = "It was created an electric car"
        case .none:
            print("None")
        }
    }
    
    @IBAction func ShowInformation(_ sender: Any) {
        switch (type){
        case .simpleCar:
            InformationLabel.text = "El automovil es de color: \(String(describing: simpleCar?.color)), cuesta: \(String(describing: simpleCar?.price)) USD y tiene \(String(describing: simpleCar?.wheels)) ruedas"
        case .electricCar:
            InformationLabel.text = "El automovil es electrico es de color: \(String(describing: electricCar?.color)), cuesta: \(String(describing: electricCar?.price)) USD y tiene \(String(describing: electricCar?.wheels)) ruedas"
        case .none:
            break
        }
    }
    
    @IBAction func TurnOn(_ sender: Any) {
        if (IsCarTurnOn!){
            InformationLabel.text = "Automovil ya encendido."
        }else {
            switch (type){
            case .simpleCar:
                IsCarTurnOn = simpleCar?.turnOn()
            case .electricCar:
                IsCarTurnOn = electricCar?.turnOn()
            case .none:
                break
            }
            InformationLabel.text = "Automovil encendido correctamente."
        }
    }
    
    @IBAction func TurnOff(_ sender: Any) {
        if (!IsCarTurnOn!){
            InformationLabel.text = "Automovil ya apagado"
        }else {
            switch (type){
            case .simpleCar:
                IsCarTurnOn = simpleCar?.turnOff()
            case .electricCar:
                IsCarTurnOn = electricCar?.turnOff()
            case .none:
                break
            }
            InformationLabel.text = "Automovil apagado correctamente."
        }
    }
    
    @IBAction func SpeedUp(_ sender: Any) {
        if (IsCarTurnOn!){
            switch (type){
            case .simpleCar:
                InformationLabel.text = simpleCar?.speedUp()
            case .electricCar:
                electricCar?.batery -= 10
                InformationLabel.text = "\(String(describing: electricCar?.speedUp())), Batery: \(String(describing: electricCar?.batery))"
            case .none:
                break
            }
        }else {
            InformationLabel.text = "Necesito estar encendido para acelerar"
        }

    }
    
    // MARK: - Navigation
}
