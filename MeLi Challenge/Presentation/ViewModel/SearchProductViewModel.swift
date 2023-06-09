//
//  SearchProductViewModel.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

final class SearchProductViewModel: ObservableObject {

    private var service: SearchProductService

    init(service: SearchProductService) {
        self.service = service
    }

    @Published var products: [Product] = [Product]()
    @Published var paging: Paging = Paging(total: 0, primaryResults: 0, offset: 0, limit: 50)
    @Published var isLoading: Bool = false

    public func search(query: String) {
        isLoading = true
        service.searchProduct(query: query) { [weak self] response in
            DispatchQueue.main.async {
                self?.products = ProductResponseMapper().map(response.results)
                self?.paging = response.paging
                self?.isLoading = false
            }
        }
    }
}
