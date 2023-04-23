//
//  MeLi_ChallengeUITests.swift
//  MeLi ChallengeUITests
//
//  Created by Jorge Bobrek on 22/04/23.
//

import XCTest

final class MeLiChallengeUITests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
