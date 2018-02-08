//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Diego Gay Saez on 08/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import XCTest
// @testable te da acceso a todo Westeros, incluidos los atributos y métodos privados.
@testable import Westeros

class HouseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence() {
        let startSigil = Sigil(image: UIImage(), description: "Huargo Wolf")
        let stark = House(name: "Stark", sigil: startSigil, words: "Winter is coming")
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Huargo Wolf")
        XCTAssertNotNil(starkSigil)

        let lanisterSigil = Sigil(image: UIImage(), description: "Lion")
        XCTAssertNotNil(lanisterSigil)
    }

}
