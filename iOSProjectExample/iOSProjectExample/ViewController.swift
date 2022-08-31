//
//  ViewController.swift
//  iOSProjectExample
//
//  Created by Juan on 30/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiqueta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etiqueta.text = "Hola!!"
        etiqueta.text = "Hola2!!"
    }

    @IBAction func cambiarTexto(_ sender: Any) {
        etiqueta.text = "cambio"
    }
    
    
}

