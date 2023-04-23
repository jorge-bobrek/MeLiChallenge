//
//  SearchProductRepositoryImpl.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

class SearchProductRepositoryImpl: SearchProductRepository {
    func get(query: String, completion: @escaping (ProductResponse) -> Void) {
        let queryItems = [URLQueryItem(name: "q", value: query)]
        var urlComps = URLComponents(string: Strings.search)!
        urlComps.queryItems = queryItems

        Bundle.main.fetchData(url: urlComps.url!, model: ProductResponse.self, completion: { data in
            completion(data)
        }, failure: { error in
            print(error)
        })
    }
}
