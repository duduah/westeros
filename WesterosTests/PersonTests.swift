//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Diego Gay Saez on 08/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {
    
    var starkHouse: House!
    var lannisterHouse: House!

    var starkSigil: Sigil!
    var lannisterSigil: Sigil!

    var ned: Person!    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!

    override func setUp() {
        super.setUp()
        
        starkSigil = Sigil(image: UIImage(), description: "Huargo Wolf")
        lannisterSigil = Sigil(image: UIImage(), description: "Lion")

        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
        lannisterHouse = House(name: "Lanister", sigil: lannisterSigil, words: "We will kill you all")

        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        robb = Person(name: "Robb", alias: "Young Wolf", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "Dwarf", house: lannisterHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistence() {
        XCTAssertNotNil(ned)
        XCTAssertNotNil(arya)
    }
    
    func testFullName() {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonEquality() {
        // Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let enano = Person(name: "Tyrion", alias: "Dwarf", house: lannisterHouse)
        XCTAssertEqual(enano, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
    
}
