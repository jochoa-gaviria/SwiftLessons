//
//  ViewController.swift
//  iOSProjectExample
//
//  Created by Juan on 30/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etiqueta.text = "Hola!!"
        myButton.setTitle("My Botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue{
            myButton.backgroundColor = .green
        }else{
            myButton.backgroundColor = .blue
        }
    }
    
    @IBAction func cambiarTexto(_ sender: Any) {
        etiqueta.text = "cambio"
    }
}

