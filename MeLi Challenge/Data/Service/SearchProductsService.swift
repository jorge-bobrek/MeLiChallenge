//
//  SearchProductService.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

protocol SearchProductService {
    func searchProduct(query: String, completion: @escaping (ProductResponse) -> Void)
}
