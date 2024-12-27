//
//  CoffeeDTO.swift
//  Coffee
//
//  Created by 김송희 on 12/26/24.
//

import SwiftUI

struct CoffeeDTO: Decodable {
    let id: Int
    let title: String
    
    func toDomain() -> CoffeeModel {
        return CoffeeModel(id: id, title: title)
    }
}
