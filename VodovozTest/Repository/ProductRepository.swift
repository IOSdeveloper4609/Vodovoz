//
//  ProductRepository.swift
//  VodovozTest
//
//  Created by Азат on 08.08.2024.
//

import Foundation


protocol ProductRepository {
    func fetchData(completion: @escaping (Result<Response, Error>) -> Void)
}
