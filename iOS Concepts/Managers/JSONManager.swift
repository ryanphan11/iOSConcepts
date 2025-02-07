//
//  JSONManager.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 2/3/25.
//

import Foundation

class JSONManager {
    public static var shared = JSONManager()
    func decode(jsonString: String,_ completion: (Codable) -> Void) {
        // Convert JSON string to Data
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                // Decode JSON to Swift object
                let user = try JSONDecoder().decode(User.self, from: jsonData)
                print("Name: \(user.name), Age: \(user.age)")
                completion(user)
            } catch {
                print("Decoding error: \(error)")
            }
        }
        
    }
}

