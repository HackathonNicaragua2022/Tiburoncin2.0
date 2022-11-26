//
//  UITests.swift
//  Tiburoncin 2.0UITests
//
//  Created by AlejandroVCastillo on 11/26/22.
//

import XCTest

class UITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testLogin() {
        let app = XCUIApplication()
        app.launch()
        
        let element = app.otherElements["loginButtonView"].firstMatch
        app.waitForElements(elements: [element: .exist])
        element.tap()
        
        let emailTextField = app.textFields["loginViewEmail"].firstMatch
        app.waitForElements(elements: [emailTextField: .exist])
        emailTextField.typeText("test@gmail.com")
        
        let passwordTextField = app.textFields["loginViewPassword"].firstMatch
        passwordTextField.typeText("test")
        
        let loginButton = app.otherElements["loginViewButton"].firstMatch
        loginButton.tap()
        
        let tabBarContainer = app.otherElements["homeTabBarContainer"].firstMatch
        app.waitForElements(elements: [tabBarContainer: .exist])
        
        XCTAssert(tabBarContainer.exists)
    }
}

extension XCUIApplication {
    func waitForElements(elements: [XCUIElement: UIStatus], timeout: TimeInterval = 45, message: String? = nil) {
        let expectations = elements.map({XCTNSPredicateExpectation(predicate: NSPredicate(format: $0.value.rawValue), object: $0.key)})
        let result = XCTWaiter.wait(for: expectations, timeout: timeout)
        if result == .timedOut {
            XCTFail(message ?? expectations.description)
        }
    }
}

enum UIStatus: String {
    case exist = "exists == true"
    case notExist = "exists == false"
    case selected = "selected == true"
    case notSelected = "selected == false"
    case hittable = "isHittable == true"
    case notHittable = "isHittable == false"
}
