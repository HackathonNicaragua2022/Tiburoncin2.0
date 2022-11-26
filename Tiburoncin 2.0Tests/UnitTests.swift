//
//  UnitTests.swift
//  Tiburoncin 2.0Tests
//
//  Created by AlejandroVCastillo on 11/26/22.
//

import XCTest
@testable import Tiburoncin_2_0

class UnitTests: XCTestCase {
    
    // MARK: - Tests
    func testDecodeString() {
        let expectedResult = "This is my string decoded"
        let encodedString = "VGhpcyBpcyBteSBzdHJpbmcgZGVjb2RlZA=="
        let decodedString = encodedString.decode() ?? ""
        XCTAssertTrue(decodedString == expectedResult)
    }
}
