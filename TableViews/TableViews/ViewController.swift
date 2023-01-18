//
//  ViewController.swift
//  TableViews
//
//  Created by Juan on 8/12/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var countries:[Countries]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
        
        recoverData()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        let alert = UIAlertController(title: "Add a country", message: "Add a new country", preferredStyle: .alert)
        alert.addTextField()
        let alertButton = UIAlertAction(title: "Add", style: .default)
        {
            (action)  in
            
            let textField = alert.textFields![0]
            let newcountry = Countries(context: self.context)
            newcountry.name = textField.text
            
            try! self.context.save()
            
            self.recoverData()
        }
        
        alert.addAction(alertButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func recoverData(){
        do {
            self.countries = try context.fetch(Countries.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Error recovering data")
        }
    }
    
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Celdas simples"
        }
        return "Celdas Custom"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0{
            return "Footer para celdas simple"
        }
        return "Footer para celdas custom"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.backgroundColor = .lightGray
                cell?.accessoryType = .disclosureIndicator
            }
            cell!.textLabel?.text = countries![indexPath.row].name
            return cell!
        }
        let cell  = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
        
        cell?.myFirstLabel.text = String(indexPath.row + 1)
        cell?.mySecondLabel.text = countries![indexPath.row].name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, view, completionHandler) in
            
            let deleteCountry = self.countries![indexPath.row]
            
            self.context.delete(deleteCountry)
            
            try! self.context.save()
            
            self.recoverData()
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let updateCountry = self.countries![indexPath.row]
        let alert = UIAlertController(title: "update country", message: "Modifiy the country", preferredStyle: .alert)
        alert.addTextField()
        
        let alertButton = UIAlertAction(title: "Edit", style: .default)
        {
            (action) in
            let textField = alert.textFields![0]
            updateCountry.name = textField.text
            
            try! self.context.save()
            self.recoverData()
        }
        
        alert.addAction(alertButton)
        self.present(alert, animated: true, completion: nil)
    }
}
