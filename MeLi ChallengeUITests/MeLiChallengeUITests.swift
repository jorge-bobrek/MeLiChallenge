//
//  MeLi_ChallengeUITests.swift
//  MeLi ChallengeUITests
//
//  Created by Jorge Bobrek on 22/04/23.
//

import XCTest

final class MeLiChallengeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testSearchAndDetail() throws {
        let app = XCUIApplication()
        app.launch()

        let buscarEnMercadoLibreTextField = app.textFields["Buscar en Mercado Libre"]
        XCTAssertTrue(buscarEnMercadoLibreTextField.waitForExistence(timeout: 5))
        buscarEnMercadoLibreTextField.tap()
        buscarEnMercadoLibreTextField.tap()
        buscarEnMercadoLibreTextField.typeText("Caminadora")
        app.buttons["Search"].tap()

        let result = app.staticTexts["Caminadora Eléctrica Home Sale Serene 110v/220v      Negra Y Gris"]
        XCTAssertTrue(result.waitForExistence(timeout: 5))
        result.tap()

        let detail = app.staticTexts["Caminadora Eléctrica Home Sale Serene 110v/220v      Negra Y Gris"]
        XCTAssertTrue(detail.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
