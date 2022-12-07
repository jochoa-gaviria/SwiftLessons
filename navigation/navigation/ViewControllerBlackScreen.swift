//
//  ViewControllerBlackScreen.swift
//  navigation
//
//  Created by Juan on 6/12/22.
//

import UIKit

class ViewControllerBlackScreen: UIViewController {

    var titulo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let title = titulo{
            self.title = title
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
