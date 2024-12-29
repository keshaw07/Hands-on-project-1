//
//  Appetizer.swift
//  Appetizers
//
//  Created by Ram, Keshaw on 02/12/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
        let id: Int
        let name: String
        let description: String
        let carbs: Int
        let calories: Int
        let protein: Int
        let price: Double
        let imageURL: String
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 001,
                                           name: "Test Appetizer",
                                           description: "This is appetizer",
                                           carbs: 00,
                                           calories: 00,
                                           protein: 00,
                                           price: 26.90,
                                           imageURL: "")
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
