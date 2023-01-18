//
//  HomeViewController.swift
//  iOS-Calculator
//
//  Created by Juan on 10/1/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    //Result
    @IBOutlet weak var ResultLabel: UILabel!
    
    //Numbers
    @IBOutlet weak var NumberZero: UIButton!
    @IBOutlet weak var NumberOne: UIButton!
    @IBOutlet weak var NumberTwo: UIButton!
    @IBOutlet weak var NumberThree: UIButton!
    @IBOutlet weak var NumberFour: UIButton!
    @IBOutlet weak var NumberFive: UIButton!
    @IBOutlet weak var NumberSix: UIButton!
    @IBOutlet weak var NumberSeven: UIButton!
    @IBOutlet weak var NumberEigth: UIButton!
    @IBOutlet weak var NumberNine: UIButton!
    @IBOutlet weak var NumberDecimal: UIButton!
    
    //Operators
    @IBOutlet weak var OperatorAC: UIButton!
    @IBOutlet weak var OperatorPlusMinus: UIButton!
    @IBOutlet weak var OperatorPercent: UIButton!
    @IBOutlet weak var OperatorResult: UIButton!
    @IBOutlet weak var OperatorAddition: UIButton!
    @IBOutlet weak var OperatorSubstraction: UIButton!
    @IBOutlet weak var OperatorDivision: UIButton!
    @IBOutlet weak var OperatorMultiplication: UIButton!
    
    // MARK: Variables
    private var total:Double = 0 //Total
    private var temp:Double = 0 // Valor por pantalla
    private var operating:Bool = false // Indica si se ha seleccionado un operador
    private var decimal:Bool = false // Indica si el valor es decimal.
    private var operation:OperationType = .none
    
    // MARK: Constants
    private enum OperationType {
        case none, addition, substraction, multiplication, division, percent
    }
    
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLength:Int = 9
    private let kTotal = "total"
    
    // Formateo para valores auxiliares.
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    // Formateo para valores mostrados en pantalla
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // Formateo para valores mostrados en pantalla en formato cientifico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.minimumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    // Formateo para valores auxiliares. Sin separadores
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // MARK: - Initialization
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NumberZero.round()
        NumberOne.round()
        NumberTwo.round()
        NumberThree.round()
        NumberFour.round()
        NumberFive.round()
        NumberSix.round()
        NumberSeven.round()
        NumberEigth.round()
        NumberNine.round()
        NumberDecimal.round()
        
        OperatorAC.round()
        OperatorResult.round()
        OperatorPercent.round()
        OperatorAddition.round()
        OperatorDivision.round()
        OperatorSubstraction.round()
        OperatorMultiplication.round()
        OperatorPlusMinus.round()
        
        NumberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        total = UserDefaults.standard.double(forKey: kTotal)
        result()
    }
    
    // MARK: - ButtonActions
    
    @IBAction func OperatorACAction(_ sender: UIButton) {
        clear()
        OperatorAC.shine()
    }
    
    
    @IBAction func OperatorPlusMinusAction(_ sender: UIButton) {
        temp *= -1
        ResultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func OperatorPercentAction(_ sender: UIButton) {
        
        if operation != .percent {
            result()
        }
        operating = true
        operation = .percent
        result()
        
        sender.shine()
    }
    
    @IBAction func OperatorDivisionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .division
        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func OperatorMultiplicationAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .multiplication
        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func OperatorSubstractionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .substraction
        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func OperatorAdditionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .addition
        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func OperatorResultAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    
    
    @IBAction func NumberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        
        ResultLabel.text = ResultLabel.text! + kDecimalSeparator
        decimal = true
        selectVisualOperation()
        sender.shine()
    }
    
    @IBAction func NumberAction(_ sender: UIButton) {
        OperatorAC.setTitle("C", for: .normal)
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        // Hemos seleccionado una operación.
        if operating {
            total = total == 0 ? temp : total
            ResultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        // Hemos seleccionado decimales.
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        let cleanCurrentTemp = currentTemp.replacingOccurrences(of: ",", with: ".")
        temp = Double(cleanCurrentTemp + String(number))!
        ResultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        selectVisualOperation()
        sender.shine()
    }
    
    //Funcion para limpiar los valores
    private func clear(){
        operation = .none
        OperatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            ResultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    private func result(){
        switch operation {
            case .none:
                // No se hace nada.
                break
            case .addition:
                total += temp
                break
            case .substraction:
                total -= temp
                break
            case .multiplication:
                total *= temp
                break
            case .division:
                if temp != 0{
                    total /= temp
                }
                break
            case .percent:
                temp /= 100
                total = temp
                break
        }
        
        //Formateo en pantalla
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLength{
            ResultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        }else {
            ResultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        selectVisualOperation()
        operation = .none
        UserDefaults.standard.set(total, forKey: kTotal)
    }
    
    private func selectVisualOperation(){
        if !operating {
            OperatorAddition.selectOperation(false)
            OperatorSubstraction.selectOperation(false)
            OperatorMultiplication.selectOperation(false)
            OperatorDivision.selectOperation(false)
        } else {
            switch operation {
            case .none, .percent:
                break
            case .addition:
                OperatorAddition.selectOperation(true)
                OperatorSubstraction.selectOperation(false)
                OperatorMultiplication.selectOperation(false)
                OperatorDivision.selectOperation(false)
                break
            case .substraction:
                OperatorSubstraction.selectOperation(true)
                OperatorAddition.selectOperation(false)
                OperatorMultiplication.selectOperation(false)
                OperatorDivision.selectOperation(false)
                break
            case .multiplication:
                OperatorMultiplication.selectOperation(true)
                OperatorAddition.selectOperation(false)
                OperatorSubstraction.selectOperation(false)
                OperatorDivision.selectOperation(false)
                break
            case .division:
                OperatorDivision.selectOperation(true)
                OperatorAddition.selectOperation(false)
                OperatorSubstraction.selectOperation(false)
                OperatorMultiplication.selectOperation(false)
                break
            }
        }
    }
}
