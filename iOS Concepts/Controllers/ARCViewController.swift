//
//  ARCViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/24/25.
//

import UIKit

class ARCViewController: UIViewController {
    @IBOutlet weak var debugLabel: UILabel!
    var debugString = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayDebug(note: "ViewDidLoad\n")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayDebug(note: "ViewDidAppear\n")
        print("ViewDidAppear")
    }
    
    func displayDebug(note: String) {
        debugString.append(note)
        debugLabel.text = debugString
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
