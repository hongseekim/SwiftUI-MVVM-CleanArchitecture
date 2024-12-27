//
//  CoffeeRepository.swift
//  Coffee
//
//  Created by 김송희 on 12/26/24.
//

import SwiftUI

protocol CoffeeRepository {
    func fetchCoffee() async throws -> [CoffeeModel]
}
