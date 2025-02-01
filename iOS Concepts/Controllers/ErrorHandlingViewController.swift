//
//  ErrorHandlingViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/31/25.
//

import UIKit
enum NumberError: Error {
    case invalidInput
}
class ErrorHandlingViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var numberInputTextField: UITextField!
    
    @IBOutlet weak var consoleOutputLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        numberInputTextField.delegate = self
    }
    
    // Function that can throw
    func checkNumber(_ number: Int) throws {
        if number < 0 {
            throw NumberError.invalidInput
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Done is pressed")
        textField.resignFirstResponder() // Dismiss Keyboard
        do {
            try checkNumber(Int(textField.text!) ?? -1)
        } catch NumberError.invalidInput {
            consoleOutputLabel.text = "Invalid Input: Please enter Positive Number."
        } catch {
            consoleOutputLabel.text = "Unexpected Error"
        }
        return true
    }
}
