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

/*
 
 Aspect                     Model                               ViewModel
 Role    Represents raw data or business entities.    Transforms and prepares data for the view layer.
 Data Logic    Only simple or core business logic.    Complex logic related to displaying or transforming data for the UI.
 Dependency    Independent, reusable entities, often tied to APIs or databases.    Depends on models and services to fetch/process data.
 Examples    Item, User, Post    ItemViewModel, UserProfileViewModel, PostListViewModel
 State Management    None (stateless, just raw data).    Manages view state (e.g., loading, success, error).
 UI Awareness    No awareness of the view or how the data is presented.    Aware of how the data will be used in the view (e.g., cell titles, formatting).
 */
// MARK: - ConceptModel Protocol

protocol ConceptModel {
    var conceptTitle: String { get }
    var conceptDescription: String { get }
}
