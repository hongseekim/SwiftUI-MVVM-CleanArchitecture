//
//  MainViewModel.swift
//  Coffee
//
//  Created by 김송희 on 12/26/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var coffees: [CoffeeModel] = []
    private let fetchSortedCoffeeUseCase: FetchSortedCoffeeUseCase
    
    init(fetchSortedCoffeeUseCase: FetchSortedCoffeeUseCase) {
        self.fetchSortedCoffeeUseCase = fetchSortedCoffeeUseCase
    }
    
    func loadCoffees() async {
        do {
            let coffees = try await fetchSortedCoffeeUseCase.execute()
            DispatchQueue.main.async {
                self.coffees = coffees
            }
        } catch {
            print("Fail to fetch coffees: \(error)")
        }
    }
}
