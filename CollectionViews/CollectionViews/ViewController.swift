//
//  ViewController.swift
//  CollectionViews
//
//  Created by Juan on 11/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let countries = ["España", "Mexico", "Peru", "Colombia", "EEUU", "Francia", "Italia"]
    
    private let cellWidth = UIScreen.main.bounds.width / 2
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
    }
}

// MARK - UiCollectionViewDataSource
extension ViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView : UICollectionView) -> Int{
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? MyCustomCollectionViewCell
        cell?.myLabel.text = countries[indexPath.row]
        return cell!
    }
}

// MARK  UICollectionViewDelegate
extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section) -> \(indexPath.row) \(countries[indexPath.row])")
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
    }
}
