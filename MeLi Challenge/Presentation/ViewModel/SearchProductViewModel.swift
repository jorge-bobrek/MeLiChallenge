//
//  SearchProductViewModel.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

final class SearchProductViewModel: ObservableObject {

    private var service = SearchProductServiceImpl()

    @Published var products: [Product] = [Product]()
    @Published var paging: Paging = Paging(total: 0, primaryResults: 0, offset: 0, limit: 50)
    @Published var isLoading: Bool = false

    public func search(query: String) {
        isLoading = true
        service.searchProduct(query: query) { [weak self] response in
            DispatchQueue.main.async {
                if response.results.isEmpty {
                    self?.products = []
                } else {
                    self?.products = ProductResponseMapper().map(response.results)
                }
                self?.paging = response.paging
                self?.isLoading = false
            }
        }
    }
}
