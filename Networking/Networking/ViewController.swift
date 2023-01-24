//
//  ViewController.swift
//  Networking
//
//  Created by Juan on 22/1/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var idUser: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var downloadImageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = ""
        name.numberOfLines = 0
        email.text = ""
        email.numberOfLines = 0
        idUser.text = ""
        idUser.numberOfLines = 0
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        
        
    }
    

    @IBAction func getUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        NetworkingProvider.shared.getUser(id: 168642, success: { (user) in
            self.activityIndicator.stopAnimating()
            self.setup(user: user)
        }, failure: { (error) in
            self.activityIndicator.stopAnimating()
            self.name.text = error.debugDescription
        })
    }
    
    
    @IBAction func postUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        let newUser = NewUser(name: "Juan Ochoa", email: "jochoa@yopmail.com", gender: "Male", status: "Active")
        NetworkingProvider.shared.addUser(user: newUser) { user in
            self.activityIndicator.stopAnimating()
            self.setup(user: user)
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.name.text = error.debugDescription
        }
    }
    
    @IBAction func putUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        let newUser = NewUser(name: "JuanOchoa", email: "jochoa@test.com", gender: nil, status: nil)
        NetworkingProvider.shared.updateUser(id: 168642, user: newUser) { user in
            self.activityIndicator.stopAnimating()
            self.setup(user: user)
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.name.text = error.debugDescription
        }
    }
    
    
    @IBAction func deleteUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        NetworkingProvider.shared.deleteUser(id: 168642) {
            self.activityIndicator.stopAnimating()
            self.name.text = "Se ha borrado el usuario con id \(168642)"
            self.email.text = ""
            self.idUser.text = ""
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.name.text = error.debugDescription
        }

    }
    
    @IBAction func downLoadImage(_ sender: Any) {
        downloadImageButton.isHidden = true
        logoImageView.kf.setImage(with: URL(string: "https://www.apple.com/v/swift/c/images/overview/icon_swift_hero_large.png"))
        
    }
    
    
    private func setup(user: User){
        self.name.text = user.fullName
        self.email.text = user.email
        self.idUser.text = user.id?.description
    }
}
