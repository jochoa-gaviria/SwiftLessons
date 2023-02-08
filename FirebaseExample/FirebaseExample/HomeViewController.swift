//
//  HomeViewController.swift
//  FirebaseExample
//
//  Created by Juan on 7/2/23.
//

import UIKit
import FirebaseAuth

enum ProviderType: String {
    case basic
}


class HomeViewController: UIViewController {

    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var closeSesionButton: UIButton!
    
    private let email:String
    private let provider:ProviderType
    
    init(email:String, provider: ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Inicio"
        emailLabel.text = email
        providerLabel.text = provider.rawValue
    }
    

    @IBAction func closeSesionAction(_ sender: Any) {
        
        switch provider {
        case .basic:
            do {
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            }catch{
                
            }

        }
        
    }
}
