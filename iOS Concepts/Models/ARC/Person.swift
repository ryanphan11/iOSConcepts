//
//  Person.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/27/25.
//

import Foundation
class Person: DebugMesssagesPrintable {
    var debugMessages: [String] = [String]()
    
    let name: String
    var car: Car? // Strong reference to a Car object

    init(name: String) {
        self.name = name

        let message = "\n\(name) is initialized."
        debugMessages.append(message)
    }

    deinit {
        let message = "\n\(name) is initialized."
        debugMessages.append(message)
    }
}
