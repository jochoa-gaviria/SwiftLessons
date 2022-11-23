//
//  ViewController.swift
//  ViewsNavigationControls
//
//  Created by Juan on 22/11/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.load(URLRequest(url: URL(string: "https://www.google.com")!))
    }


    @IBAction func myButtonAction(_ sender: Any) {
        myView.isHidden = true
    }
}

