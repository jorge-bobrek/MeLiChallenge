//
//  SearchProductRepository.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

protocol SearchProductRepository {
    func get(query: String, completion: @escaping (_ response: ProductResponse) -> Void)
}
