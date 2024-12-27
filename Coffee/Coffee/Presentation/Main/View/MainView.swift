//
//  MainView.swift
//  Coffee
//
//  Created by 김송희 on 12/24/24.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel: MainViewModel

    init(viewModel: MainViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        List(viewModel.coffees, id: \.id) {
            Text($0.title)
        }
        .onAppear {
            Task {
                await viewModel.loadCoffees()
            }
        }
    }
}
