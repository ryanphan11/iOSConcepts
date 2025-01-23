//
//  MainViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/17/25.
//

import UIKit

// MARK: - Model
struct Item {
    let title: String
    let subtitle: String
}

// MARK: - ViewModel
class ItemViewModel {
    private var items: [Item] = []

    var numberOfItems: Int {
        return items.count
    }

    func item(at index: Int) -> Item {
        return items[index]
    }

    func loadItems(completion: @escaping () -> Void) {
        // Simulate data fetching (e.g., from an API or database)
        DispatchQueue.global().async {
            self.items = [
                Item(title: "Item 1", subtitle: "Subtitle 1"),
                Item(title: "Item 2", subtitle: "Subtitle 2"),
                Item(title: "Item 3", subtitle: "Subtitle 3")
            ]
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}

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
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedItem = viewModel.item(at: indexPath.row)
        print("Selected item: \(selectedItem.title)")

        // Perform actions based on the selected item, such as navigation
    }
}
