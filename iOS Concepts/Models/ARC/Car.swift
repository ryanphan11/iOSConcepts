//
//  Car.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/27/25.
//

import Foundation

class Car: DebugMesssagesPrintable {
    var debugMessages = [String]()
    let model: String
    weak var owner: Person? // Weak reference to a Person object

    init(model: String) {
        self.model = model
        
        let message = "\n\(model) car is initialized."
        debugMessages.append(message)
    }

    deinit {
        let message = "\n\(model) car is de-initialized."
        debugMessages.append(message)
    }
}
