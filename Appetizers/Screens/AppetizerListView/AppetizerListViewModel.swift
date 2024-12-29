//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Ram, Keshaw on 03/12/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published  var appetizers : [Appetizer] = []
    @Published  var alertItem : AlertItem?
    @Published var isLoading = false
    
    func getAppetizerData() {
        isLoading = true
        NetworkManager.shared.getAppetizer {  result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invaildURL:
                        self.alertItem = AlertContex.invaildURL
                    case .invalidResponse:
                        self.alertItem = AlertContex.invalidResponse
                    case .invaildData:
                        self.alertItem = AlertContex.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContex.unableToComplete
                    }
                }
            }
        }
    }
}
