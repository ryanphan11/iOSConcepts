//
//  ARCViewModel.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/27/25.
//

import Foundation



class ARCViewModel: DebugMesssagesPrintable {
    var debugMessages = [String]()
    let person: Person
    let car: Car
    init() {
        person = Person(name: "Alice")
        car = Car(model: "Tesla")
        
        // Step 2: Establish relationships
        person.car = car        // Strong reference from Person to Car
        car.owner = person      // Weak reference from Car to Person
        collectDebugMessage()
    }
    
    func collectDebugMessage() {
        // Both objects exist and are properly referenced
        let message1 = "\n\(person.name) owns a \(person.car?.model ?? "no car")."
        let message2 = "\n\(car.model) is owned by \(car.owner?.name ?? "no one")."

        debugMessages.append(message1)
        debugMessages.append(message2)
    }
}


