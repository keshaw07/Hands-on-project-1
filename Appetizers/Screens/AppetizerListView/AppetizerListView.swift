//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Ram, Keshaw on 02/12/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                         AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("Appetizers")
            }
            
            .onAppear {
                viewModel.getAppetizerData()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertIem in
            Alert(title: alertIem.title,
                  message: alertIem.message,
                  dismissButton: alertIem.dismissbutton)
        }
            
        }
    }


#Preview {
    AppetizerListView()
}
