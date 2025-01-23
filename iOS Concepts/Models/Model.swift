//
//  Model.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/23/25.
//

import Foundation

/*
 Model Responsibilities:
    The Model is responsible for representing the core data and business logic of your app. It often corresponds to entities in your app (e.g., User, Item, Post) or objects fetched from an API or database.

    Responsibilities of the Model:

    Data Representation: Structs or classes that represent raw data, often fetched from a server or database.
    Decoding/Encoding: Handles parsing of JSON or other formats (e.g., using Codable).
    Minimal Business Logic: If applicable, models can include simple computed properties or utility methods.
 */
// MARK: - ConceptModel Protocol

protocol ConceptModel {
    var conceptTitle: String { get }
    var conceptDescription: String { get }
}
