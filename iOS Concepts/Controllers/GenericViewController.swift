//
//  GenericViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 2/1/25.
//

import UIKit

class GenericViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textFieldA: UITextField!
    
    @IBOutlet weak var textFieldB: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldB.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func swap<T>(_ a:inout T,_ b:inout T) {
        let temp = a
        a = b
        b = temp
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        swap(&textFieldA.text, &textFieldB.text)

        return true
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
