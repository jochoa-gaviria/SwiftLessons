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
        
    }
    
    // MARK: - ButtonActions
    
    @IBAction func OperatorACAction(_ sender: UIButton) {
        OperatorAC.shine()
    }
    
    
    @IBAction func OperatorPlusMinusAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func OperatorPercentAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func OperatorDivisionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func OperatorMultiplicationAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func OperatorSubstractionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func OperatorAdditionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func OperatorResultAction(_ sender: UIButton) {
        sender.shine()
    }
    
    
    @IBAction func NumberDecimalAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func NumberAction(_ sender: UIButton) {
        sender.shine()
        print (sender.tag)
    }
}
