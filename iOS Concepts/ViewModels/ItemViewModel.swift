//
//  ItemViewModel.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/23/25.
//

import Foundation

// MARK: - ViewModel
/*
 ViewModel Responsibilities:
     The ViewModel manages all business logic and transforms raw data from the Model into a form that is usable by the ViewController. It is responsible for any logic related to the view but does not directly manipulate the UI.

     Key Responsibilities of the ViewModel:

     Data Transformation:
     Converts raw data from the model into a format that the ViewController can easily consume.
     This includes formatting strings, handling dates, filtering, or aggregating data.
     State Management:
     Keeps track of the state of the data (e.g., loading, error, or success).
     Often uses bindings or closures to notify the ViewController of state changes.
     Business Logic:
     Any logic that is specific to the feature but doesn’t belong in the Model (e.g., sorting, searching, or data validation).
     Encapsulates the logic for user actions.
     Fetching Data:
     Fetches or requests data from services (e.g., networking or database).
     Interacts with the Model to retrieve and store data.
     Communication:
     Notifies the ViewController when data has changed, using bindings (e.g., Combine, RxSwift, or closures).
 */
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
                Item(conceptTitle: "ARC", conceptDescription: ""),
                Item(conceptTitle: "SOLID", conceptDescription: ""),
                Item(conceptTitle: "Concept 3", conceptDescription: "Concept 3 Description")
            ]
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
