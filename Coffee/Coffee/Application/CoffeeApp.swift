//
//  CoffeeApp.swift
//  Coffee
//
//  Created by 김송희 on 12/24/24.
//

import SwiftUI

@main
struct CoffeeApp: App {
    private let baseURL: URL = {
        guard let url = URL(string: "https://api.sampleapis.com/coffee/hot") else {
            fatalError("Invalid base URL")
        }
        return url
    }()
    
    var body: some Scene {
        let repository = DefaultCoffeeRepository(baseURL: baseURL)
        let useCase = FetchSortedCoffeeUseCase(repository: repository)
        let viewModel = MainViewModel(fetchSortedCoffeeUseCase: useCase)
        
        WindowGroup {
            MainView(viewModel: viewModel)
        }
    }
}
