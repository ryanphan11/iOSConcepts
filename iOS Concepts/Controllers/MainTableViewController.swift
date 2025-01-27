//
//  MainViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/17/25.
//

import UIKit
/*
     Why This Structure Works
     Scalability: Each feature is modular and self-contained, making it easier to expand or refactor.
     Readability: Separating layers (Model, ViewModel, View, Controller) keeps responsibilities clear.
     Reusability: Views and ViewModels can often be reused in other parts of the app.
     Testability: The ViewModel is independent of the UI, making it easier to unit test.
 */
// MARK: - ViewController
class MainTableViewController: UITableViewController {

    private let viewModel = ItemViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Items"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // Load data from ViewModel
        viewModel.loadItems { [weak self] in
            self?.tableView.reloadData()
        }
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = viewModel.item(at: indexPath.row)
        
        // Configure cell
        cell.textLabel?.text = item.conceptTitle
        cell.detailTextLabel?.text = item.conceptDescription
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedItem = viewModel.item(at: indexPath.row)
        print("Selected item: \(selectedItem.conceptTitle)")

        performSegue(withIdentifier: "\(indexPath.row)", sender: nil)
    }
}
