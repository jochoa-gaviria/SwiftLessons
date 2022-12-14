//
//  Car.swift
//  carsFactory
//
//  Created by Juan on 13/12/22.
//

import Foundation

class Car
{
    var color:String = "Neutro"
    var wheels:Int = 4
    var price:Double = 5000
    
    func turnOn() -> Bool {
        return true
    }
    
    func turnOff() -> Bool {
        return false
    }
    
    func speedUp() -> String {
        return "Estoy acelerando!!"
    }
}
