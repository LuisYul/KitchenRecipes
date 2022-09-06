//
//  KitchenRecipesUITests.swift
//  KitchenRecipesUITests
//
//  Created by Luis Baltodano on 25/08/22.
//

import XCTest

class KitchenRecipesUITests: XCTestCase {
    
    let app = XCUIApplication()

    func testRunApp() throws {
        // UI tests must launch the application that they test.
        app.launch()
    }
    
    func testShowRecipeDetailAndBack() {
        app.staticTexts["Causa Rellena"].tap()
        sleep(2)
        app.navigationBars.buttons["Recetas"].tap()
        sleep(2)
        app.staticTexts["Papa Rellena"].tap()
        sleep(2)
        app.navigationBars.buttons["Recetas"].tap()
        sleep(3)
    }
    
    func testShowRecipeSourceAndBack() {
        app.staticTexts["Lomo Saltado"].tap()
        sleep(2)
        app.buttons["Ver Origen"].tap()
        sleep(2)
        app.navigationBars.buttons["Lomo Saltado"].tap()
        sleep(2)
        app.navigationBars.buttons["Recetas"].tap()
        sleep(2)
    }
    
    func testShowRecipeSourceAndInteractWithMap() {
        app.staticTexts["Lomo Saltado"].tap()
        sleep(2)
        app.buttons["Ver Origen"].tap()
        sleep(2)
        let map = app.otherElements.matching(identifier: "GMSMapView").element(boundBy: 0)
        map.pinch(withScale: 2, velocity: 1)
        map.rotate(CGFloat.pi/3, withVelocity: 1.0)
        map.swipeLeft()
        map.swipeRight()
        map.swipeDown()
        map.swipeDown()
        sleep(2)
    }
}
