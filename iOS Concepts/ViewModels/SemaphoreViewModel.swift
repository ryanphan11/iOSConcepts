//
//  SemaphoreViewModel.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 2/3/25.
//

import Foundation

class SemaphoreViewModel {
    private let n: Int
    private let fooSemaphore = DispatchSemaphore(value: 1) // Start unlocked
    private let barSemaphore = DispatchSemaphore(value: 0) // Start locked

    init(_ n: Int) {
        self.n = n
    }

    func foo(_ printFoo: () -> Void) {
        for _ in 0..<n {
            fooSemaphore.wait() // Wait until it's foo's turn
            printFoo()          // Print "foo"
            barSemaphore.signal() // Unlock barSemaphore to allow "bar"
        }
    }

    func bar(_ printBar: () -> Void) {
        for _ in 0..<n {
            barSemaphore.wait() // Wait until it's bar's turn
            printBar()          // Print "bar"
            fooSemaphore.signal() // Unlock fooSemaphore to allow "foo"
        }
    }
}

