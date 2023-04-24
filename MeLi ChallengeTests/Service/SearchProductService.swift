//
//  SearchProductService.swift
//  MeLi ChallengeTests
//
//  Created by Jorge Bobrek on 23/04/23.
//

import XCTest
@testable import MeLi_Challenge

final class SearchProductServiceTests: XCTestCase {

    private var sut: SearchProductService!
    private var repository: MockSearchProductRepository!

    override func setUp() {
        super.setUp()
        repository = MockSearchProductRepository()
        sut = SearchProductServiceImpl(repository: repository)
    }

    override func tearDown() {
        super.tearDown()
        repository = nil
        sut = nil
    }

    func testSearchProductsSuccess() throws {
        var data: [Result] = []
        let expectation = expectation(description: "Wait for response")

        repository.isSuccess = true

        sut.searchProduct(query: "test") { response in
            data = response.results
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
        XCTAssert(!data.isEmpty)
    }

    func testSearchProductsFail() throws {
        var data: [Result] = []
        let expectation = expectation(description: "Wait for response")

        repository.isSuccess = false

        sut.searchProduct(query: "test") { response in
            data = response.results
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
        XCTAssert(data.isEmpty)
    }

}
