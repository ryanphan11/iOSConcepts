//
//  ARCViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/24/25.
//

import UIKit

class ARCViewController: UIViewController {
    var debugMessage: String = ""
    @IBOutlet weak var debugLabel: UILabel!
    var currentARCViewModel: ARCViewModel
    
    required init?(coder: NSCoder) {
        currentARCViewModel = ARCViewModel()
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        getMessagesForUI(with: currentARCViewModel.car)
        getMessagesForUI(with: currentARCViewModel.person)
        getMessagesForUI(with: currentARCViewModel)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func displayDebug(message: String) {
        debugMessage += message
        debugLabel.text = debugMessage
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

extension ARCViewController {
    func getMessagesForUI(with object: DebugMesssagesPrintable) {
        for message in object.debugMessages {
            displayDebug(message: message)
        }
    }
}
