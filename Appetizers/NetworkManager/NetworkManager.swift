//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Ram, Keshaw on 03/12/24.
//

import Foundation
import SwiftUI


final class NetworkManager {
    
    static let shared = NetworkManager()
    private let chache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    static let appetizerURL = baseURL + "appetizers"
    
    func getAppetizer(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: NetworkManager.appetizerURL) else {
            completed(.failure(.invaildURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invaildData))
                return
            }
            
            do {
                
                let decoderResponse = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                completed(.success(decoderResponse.request))
                  
            } catch{
                completed(.failure(.invaildData))
            }
            
            
        }
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let chacheKey = NSString(string: urlString)
        
        if let image = chache.object(forKey: chacheKey) {
            completed(nil)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data , let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.chache.setObject(image, forKey: chacheKey)
            completed(image)
            
        }
        
        task.resume()
    }
}
