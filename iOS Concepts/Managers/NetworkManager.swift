//
//  NetworkManager.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 2/12/25.
//

import Foundation

struct NetworkManager: NetworkService {
    func getData() -> String {
        return "Here is some Network Data"
    }
}
