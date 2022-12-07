//
//  ViewController.swift
//  navigation
//
//  Created by Juan on 5/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func greenButton(_ sender: Any) {
        performSegue(withIdentifier: "greenScreen", sender: self)
    }
    @IBAction func blackButton(_ sender: Any) {
        performSegue(withIdentifier: "blackScreen", sender: self)
    }
    @IBAction func redButton(_ sender: Any) {
        performSegue(withIdentifier: "redScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        switch segue.identifier{
        case "greenScreen":
            if let destination = segue.destination as? ViewControllerGreenScreen{
                destination.titulo = "Verde"
            }
        case "blackScreen":
            if let destination = segue.destination as? ViewControllerBlackScreen{
                destination.titulo = "Negro"
            }
        case "redScreen":
            if let destination = segue.destination as? ViewControllerRedScreen{
                destination.titulo = "Rojo"
            }
        case .none:
            break
        case .some(_):
            break
        }
        
    }
}

