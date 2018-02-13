//
//  RepositoryTest.swift
//  WesterosTests
//
//  Created by Diego Gay Saez on 13/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
    }
}
