//
//  CreateConstraintViewController.swift
//  AdvancedAutoLayout
//
//  Created by Juan on 3/1/23.
//

import UIKit

class CreateConstraintViewController: UIViewController {

    @IBOutlet weak var yellowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Constraint Heigth and Width
        yellowView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        // Constraint positions
        
        // To disable automatic constraints
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        
        // Creating constraint to general view
        view.addConstraint(NSLayoutConstraint(item: yellowView!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1000, constant: 16))
        
        // Creating constraint to child view. (yellow)
        yellowView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
    }
}
