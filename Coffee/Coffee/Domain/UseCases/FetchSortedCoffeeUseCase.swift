//
//  FetchSortedCoffeeUseCase.swift
//  Coffee
//
//  Created by 김송희 on 12/26/24.
//

import SwiftUI

protocol FetchCoffeeUseCase {
    func execute() async throws -> [CoffeeModel]
}

class FetchSortedCoffeeUseCase: FetchCoffeeUseCase {
    private let repository: CoffeeRepository
    
    init(repository: CoffeeRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [CoffeeModel] {
        let coffees = try await repository.fetchCoffee()
        return coffees.filter{
            $0.title.lowercased().contains("latte")
        }
    }
}
