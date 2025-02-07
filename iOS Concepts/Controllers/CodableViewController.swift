//
//  CodableViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 2/3/25.
//

import UIKit

class CodableViewController: UIViewController {
    @IBOutlet weak var JSONTextView: UITextView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func decodeButtonPressed(_ sender: Any) {
        let jsonString = """
        {
            "name": "John Doe",
            "age": 25
        }
        """
        JSONManager.shared.decode(jsonString: jsonString) { result in
            if let user = result as? User {
                resultLabel.text = "Name: \(user.name) Age: \(user.age)"
            }
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
