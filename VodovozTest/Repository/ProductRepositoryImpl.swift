//
//  ProductRepositoryImpl.swift
//  VodovozTest
//
//  Created by Азат on 08.08.2024.
//

import Foundation

final class ProductRepositoryImpl: ProductRepository {
    
    func fetchData(completion: @escaping (Result<Response, Error>) -> Void) {
        let urlString = "https://szorin.vodovoz.ru/newmobile/glavnaya/super_top.php?action=topglav"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let responseObject = try JSONDecoder().decode(Response.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
    
