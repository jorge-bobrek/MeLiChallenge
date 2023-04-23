//
//  SearchProductServiceImpl.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

class SearchProductServiceImpl: SearchProductService {
    private var repository = SearchProductRepositoryImpl()

    func searchProduct(query: String, completion: @escaping (ProductResponse) -> Void) {
        repository.get(query: query) { response in
            completion(response)
        }
    }
}
