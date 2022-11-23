//
//  ViewController.swift
//  ViewsNavigationControls
//
//  Created by Juan on 22/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func myButtonAction(_ sender: Any) {
        myView.isHidden = true
    }
}

