//
//  ViewController.swift
//  Networking
//
//  Created by Juan on 22/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    

    @IBAction func getUserAction(_ sender: Any) {
        print("calling!!")
        NetworkingProvider.shared.getUser(id: 464)
    }
    
}

