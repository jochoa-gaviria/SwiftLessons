//
//  ViewController.swift
//  carsFactory
//
//  Created by Juan on 13/12/22.
//

import UIKit

class ViewController: UIViewController {

    var typeCar : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func CreateSimpleCar(_ sender: Any) {
        typeCar = 0
        performSegue(withIdentifier: "carsDetailSegue", sender: self)
    }
    
    @IBAction func CreateElectricCar(_ sender: Any) {
        typeCar = 1
        performSegue(withIdentifier: "carsDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CarDetailViewController{
            if typeCar == 0{
                destination.type = .simpleCar
            }else if typeCar == 1 {
                destination.type = .electricCar
            }
        }
    }
}

