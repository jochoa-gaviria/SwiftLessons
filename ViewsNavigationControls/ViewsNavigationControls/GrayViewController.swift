//
//  GrayViewController.swift
//  ViewsNavigationControls
//
//  Created by Juan on 30/11/22.
//

import UIKit

class GrayViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.isHidden = true
        mySearchBar.delegate = self
    }
}

extension GrayViewController : UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mySearchBar.resignFirstResponder()
        myLabel.text = mySearchBar.text
        myLabel.isHidden = false
    }
}
