//
//  MockSearchProductService.swift
//  MeLi ChallengeTests
//
//  Created by Jorge Bobrek on 23/04/23.
//

import Foundation
@testable import MeLi_Challenge

class MockSearchProductService: SearchProductService {
    var isSuccess: Bool = true

    func searchProduct(query: String, completion: @escaping (ProductResponse) -> Void) {
        completion(self.isSuccess ? MockProductsResponse.response : MockProductsResponse.emptyResponse)
    }
}
