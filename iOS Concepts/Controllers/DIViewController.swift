//
//  DIViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 2/12/25.
//

import UIKit

class DIViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var viewModel: DIViewModel
    
    required init?(coder: NSCoder) {
        viewModel = DIViewModel(networkManager: NetworkManager())
        super.init(coder: coder)
    }
    
    init(viewModel: DIViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = viewModel.networkManager.getData()
        // Do any additional setup after loading the view.
    }
    
}
