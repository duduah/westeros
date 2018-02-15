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
    
    var localHouses: [House]!
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    func testLocalRepositoryHousesCreation() {
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnsHouseByCaseInsensitively() {
        let stark = Repository.local.house(named: "sTaRk")
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }

    // Este test no es de los mejores, ya que estamos haciéndolo basándonos en los datos de pruebas.
    // Si cambiamos los datos de pruebas, este test va a fallar y UN TEST NO PUEDE FALLAR A MENOS QUE EL CÓDIGO ESTÉ ROTO.
    func testHouseFiltering() {
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(filtered.count, 1)
        
        // En este caso, si en lugar de "Winter" pongo "winter" ya estamos dependiendo de los datos.
        let otherFilter = Repository.local.houses(filteredBy: {$0.words.contains("Winter")})
        XCTAssertEqual(otherFilter.count, 1)
    }
}
