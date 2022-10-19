//
//  ViewController.swift
//  Calculator
//
//  Created by Oğuz Kaan Altun on 1.10.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var displayLabel: UILabel!
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var operationButtons: [UIButton]!
    @IBOutlet var scientificButtons: [UIButton]!
    @IBOutlet var equalButton: UIButton!
    @IBOutlet var transformButton: UIButton!
    
    // MARK: - Properties
    private var isTypingNewNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let value = Double(displayLabel.text!) else { fatalError("displayValue: Cannot convert to Double") }
            return value
        }
        set {
            let isInt = floor(newValue) == newValue // checks if the value is an integer
            if isInt { // if yes, drops decimal part .0
                displayLabel.text = String(newValue).replacing(/\.0*/, with: "")
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    private var resultValue: Double {
        get {
            return displayValue
        }
        set {
            let isInt = floor(newValue) == newValue
            if isInt {
                resultLabel.text = String(newValue).replacing(/\.0*/, with: "")
            } else {
                resultLabel.text = String(newValue)
            }
        }
    }
    private var calculator = Calculator() // Calculator object
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeButtons()
        customizeViews()
    }
    
    // MARK: - Actions
    @IBAction func transformButtonTapped(_ button: UIButton) {
        // hides or shows scientific buttons.
        stackView.isHidden.toggle()
        for button in scientificButtons {
            button.isHidden.toggle()
        }
    }
    
    @IBAction func operationButtonTapped(_ button: UIButton) {
        // performs when a non-number button is tapped.
        // does calculation and updates display and result labels using displayValue.
        if isTypingNewNumber && button.currentTitle == "-" {
            isTypingNewNumber = false
            displayLabel.text = "-"
            return
        }
        isTypingNewNumber = true
        calculator.setNumber(to: displayValue)
        if let operation = button.currentTitle {
            if let resultOfOperation = calculator.calculate(with: operation) {
                displayValue = resultOfOperation
                if operation == "=" {
                    resultValue = displayValue
                }
            }
        }
    }
    
    @IBAction func numberButtonTapped(_ button: UIButton) {
        // performs when a number or decimal separator (.) is tapped.
        // changes display value either by setting or appending.
        if let number = button.currentTitle {
            if isTypingNewNumber {
                if number == "." {
                    displayLabel.text = "0."
                } else { displayLabel.text = number }
                isTypingNewNumber = false
            } else {
                if number == "." {
                    if displayLabel.text!.contains(".") { return }
                }
                displayLabel.text?.append(number)
            }
        }
    }
    
    // MARK: Functions
    func customizeViews() {
        // initialize display and result labels. Hide top stack view of buttons for minimal calculator.
        displayLabel.text = "0"
        resultLabel.text = " "
        stackView.isHidden = true
    }
    
    func customizeButtons() {
        // customize color, font, title of all buttons
        equalButton.layer.cornerRadius = equalButton.bounds.height / 2
        equalButton.setTitleColor(.white, for: .normal)
        equalButton.backgroundColor = .systemIndigo
        equalButton.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .semibold)
        
        
        transformButton.setTitleColor(.systemIndigo, for: .normal)
        transformButton.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .heavy)
        
        for button in numberButtons {
            button.setTitleColor(UIColor.label, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .medium)
        }
        
        for button in operationButtons {
            button.setTitleColor(UIColor.systemIndigo, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .medium)
        }
        
        for button in scientificButtons {
            button.isHidden = true
            button.setTitleColor(UIColor.systemGray, for: .normal)
            if button.currentTitle == "e" {
                button.setTitleColor(UIColor.label, for: .normal)
                button.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .medium)
            } else {
                button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .regular)
            }
        }
    }
    
    
}

