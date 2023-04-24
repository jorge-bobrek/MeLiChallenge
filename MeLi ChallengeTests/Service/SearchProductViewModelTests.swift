//
//  SearchProductViewModelTests.swift
//  MeLi ChallengeTests
//
//  Created by Jorge Bobrek on 23/04/23.
//

import XCTest
@testable import MeLi_Challenge

final class SearchProductViewModelTests: XCTestCase {

    private var sut: SearchProductViewModel!
    private var service: MockSearchProductService!

    override func setUp() {
        super.setUp()
        service = MockSearchProductService()
        sut = SearchProductViewModel(service: service)
    }

    override func tearDown() {
        super.tearDown()
        service = nil
        sut = nil
    }

    func testSearchProduct() throws {
        let productsExpectation = expectation(description: "Expect the products list")
        let pagingExpectation = expectation(description: "Expect the paging")

        service.isSuccess = true

        sut.search(query: "test")

        let productsSubscriber = sut.$products.sink {
            guard $0.count > 0 else { return }
            XCTAssertEqual($0.count, 2)
            productsExpectation.fulfill()
        }
        let pagingSubscriber = sut.$paging.sink {
            guard $0.total > 0 else { return }
            XCTAssertEqual($0.total, 2)
            pagingExpectation.fulfill()
        }

        wait(for: [productsExpectation, pagingExpectation], timeout: 1.0)
    }

}
