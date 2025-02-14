//
//  GCDViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 2/13/25.
//

import UIKit

class GCDViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func asyncPressed(_ sender: Any) {
    let textArray = ["First", "Second", "Third", "Fourth", "Fifth"]
               
       for text in textArray.shuffled() { // Randomize the order
           DispatchQueue.global().async {
               // Simulate a random delay
               let delay = Double.random(in: 0.5...2.0)
               Thread.sleep(forTimeInterval: delay)
               
               DispatchQueue.main.async { [weak self] in
                   // Update text on the main thread
                   self?.label1.text = text
               }
           }
       }
    }
    
    @IBAction func syncPressed(_ sender: Any) {
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
