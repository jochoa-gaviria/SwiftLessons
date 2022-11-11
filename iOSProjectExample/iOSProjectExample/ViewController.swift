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
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myStepperLabel: UILabel!
    @IBOutlet weak var mySwitchLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    //Variables
    private let myPickerViewValues = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Labels
        etiqueta.text = "Hola!!"
        
        myStepperLabel.textColor = .darkGray
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 36)
        myStepperLabel.text = "1"
        
        mySwitchLabel.text = "Está apagado"
        
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
        
        //Indicators
        //ProgressView
        myProgressView.progress = 0
        
        //ActivityIndicator
        myActityIndicator.color = .orange
        myActityIndicator.startAnimating()
        myActityIndicator.hidesWhenStopped = true
        
        //TextField
        myTextField.textColor = .brown
        myTextField.placeholder = "Escribe algo"
        myTextField.delegate = self

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
        var progress:Float = 0
        switch mySlider.value {
        case 1..<2:
            setSliderAction(index: 0)
            progress = 0.2
        case 2..<3:
            setSliderAction(index: 1)
            progress = 0.4
        case 3..<4:
            setSliderAction(index: 2)
            progress = 0.6
        case 4..<5:
            setSliderAction(index: 3)
            progress = 0.8
        default:
            setSliderAction(index: 4)
            progress = 1
        }
        
        myProgressView.progress = progress
    }
    
    
    @IBAction func mySteperAction(_ sender: Any) {
        let value = mySteper.value
        mySlider.value = Float(value)
        mySegmenterControl.selectedSegmentIndex = Int(value) - 1
        myPageControl.currentPage = Int(value) - 1
        myPickerView.selectRow(Int(value) - 1, inComponent: 0, animated: true)
        myButton.setTitle(myPickerViewValues[Int(value) - 1], for: .normal)
        myStepperLabel.text = "\(value)"
    }
    
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn{
            myPickerView.isHidden = false
            myActityIndicator.stopAnimating()
            mySwitchLabel.text = "Está encendido"
        }
        else {
            myPickerView.isHidden = true
            myActityIndicator.startAnimating()
            mySwitchLabel.text = "Está apagado"
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

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(myTextField.text, for: .normal)
    }
}

