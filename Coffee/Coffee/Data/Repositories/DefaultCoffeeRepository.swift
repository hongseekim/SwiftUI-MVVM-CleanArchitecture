//
//  DefaultCoffeeRepository.swift
//  Coffee
//
//  Created by 김송희 on 12/26/24.
//

import SwiftUI
import Alamofire

class DefaultCoffeeRepository: CoffeeRepository {
    private let baseURL: URL
    private let session: Session
    
    init(baseURL: URL, session: Session = .default) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func fetchCoffee() async throws -> [CoffeeModel] {
        let url = baseURL
        let data = try await session.request(url)
            .validate()
            .serializingDecodable([CoffeeDTO].self)
            .value
        return data.map { $0.toDomain() }
    }
}
