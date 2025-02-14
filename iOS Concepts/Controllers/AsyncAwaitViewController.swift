//
//  AsyncAwaitViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 2/14/25.
//

import UIKit

class AsyncAwaitViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            let data = await fetchData()
            print(data)
            DispatchQueue.main.async { [weak self] in
                self?.resultLabel.text = data
            }
        }
    }
    
    func fetchData() async -> String {
        return "Data Fetched"
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
