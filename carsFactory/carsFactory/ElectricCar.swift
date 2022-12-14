//
//  ElectricCar.swift
//  carsFactory
//
//  Created by Juan on 13/12/22.
//

import Foundation

class ElectricCar : Car {
    var batery:Double = 100
    
    func chargerBatery() -> String {
        batery = 100
        return "Carga Exitosa"
    }
}
