//
//  ViewController.swift
//  iOSProjectExample
//
//  Created by Juan on 30/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmenterControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var mySteper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    
    //Variables
    private let myPickerViewValues = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etiqueta.text = "Hola!!"
        
        //Button
        myButton.setTitle("My Botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        //PickerView
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        //PageControl
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        //SegmentedControl
        
        mySegmenterControl.removeAllSegments()
        for (index, value) in myPickerViewValues.enumerated(){
            mySegmenterControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        //Slider
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.value = 1
        
        //Steper
        mySteper.minimumValue = 1
        mySteper.maximumValue = Double(myPickerViewValues.count)
        
        //Switch
        mySwitch.onTintColor = .purple
        mySwitch.isOn = false
    }
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue{
            myButton.backgroundColor = .green
        }else{
            myButton.backgroundColor = .blue
        }
    }
    
    @IBAction func cambiarTexto(_ sender: Any) {
        etiqueta.text = "cambio"
    }
    
    
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        mySegmenterControl.selectedSegmentIndex = myPageControl.currentPage
        myButton.setTitle(myPickerViewValues[myPageControl.currentPage], for: .normal)
        mySlider.value = Float(myPageControl.currentPage) + 1
        mySteper.value = Double(myPageControl.currentPage) + 1
    }
    
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmenterControl.selectedSegmentIndex, inComponent: 0, animated: true)
        myPageControl.currentPage = mySegmenterControl.selectedSegmentIndex
        myButton.setTitle(myPickerViewValues[mySegmenterControl.selectedSegmentIndex], for: .normal)
        mySlider.value = Float(mySegmenterControl.selectedSegmentIndex) + 1
        mySteper.value = Double(mySegmenterControl.selectedSegmentIndex) + 1
    }
    
    
    
    @IBAction func mySliderAction(_ sender: Any) {
        switch mySlider.value {
        case 1..<2:
            setSliderAction(index: 0)
        case 2..<3:
            setSliderAction(index: 1)
        case 3..<4:
            setSliderAction(index: 2)
        case 4..<5:
            setSliderAction(index: 3)
        default:
            setSliderAction(index: 4)
        }
    }
    
    
    @IBAction func mySteperAction(_ sender: Any) {
        let value = mySteper.value
        mySlider.value = Float(value)
        mySegmenterControl.selectedSegmentIndex = Int(value) - 1
        myPageControl.currentPage = Int(value) - 1
        myPickerView.selectRow(Int(value) - 1, inComponent: 0, animated: true)
        myButton.setTitle(myPickerViewValues[Int(value) - 1], for: .normal)
    }
    
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn{
            myPickerView.isHidden = false
        }
        else {
            myPickerView.isHidden = true
        }
    }
    
    
    func setSliderAction(index:Int){
        mySegmenterControl.selectedSegmentIndex = index
        myPageControl.currentPage = index
        myPickerView.selectRow(index, inComponent: 0, animated: true)
        myButton.setTitle(myPickerViewValues[index], for: .normal)
        mySteper.value = Double(index) + 1
    }
}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = row
        mySegmenterControl.selectedSegmentIndex = row
        mySlider.value = Float(row) + 1
        mySteper.value = Double(row) + 1
    }
    
}

