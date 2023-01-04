//
//  ModifyConstraintViewController.swift
//  AdvancedAutoLayout
//
//  Created by Juan on 3/1/23.
//

import UIKit

class ModifyConstraintViewController: UIViewController {

    @IBOutlet weak var ViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var TopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ViewHeightConstraint.constant = 300
        TopConstraint.constant = 64
    }
}
