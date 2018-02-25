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
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!

    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    var cersei: Person!
    var jaime: Person!


    override func setUp() {
        super.setUp()
        
        starkSigil = Sigil(image: UIImage(), description: "Huargo Wolf")
        lannisterSigil = Sigil(image: UIImage(), description: "Lion")

//        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
//        lannisterHouse = House(name: "Lanister", sigil: lannisterSigil, words: "We will kill you all")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name: "Lanister", sigil: lannisterSigil, words: "We will kill you all", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)

        robb = Person(name: "Robb", alias: "Young Wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "Dwarf", house: lannisterHouse)
        cersei = Person(name: "Cersei", house: lannisterHouse)
        jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence() {
        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
    }
    
    func testSigilExistence() {
        XCTAssertNotNil(starkSigil)
        XCTAssertNotNil(lannisterSigil)
    }

    func testAddPersons() {
        XCTAssertEqual(starkHouse.count, 0)

        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)

        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
        lannisterHouse.add(persons: cersei, jaime, jaime, jaime, cersei)
        XCTAssertEqual(lannisterHouse.count, 2)
    }
    
    func testHouseEquality() {
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(jinxed, starkHouse)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHouseHashable() {
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison() {
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
    func testHouseReturnsSortedArrayOfMembers() {
        starkHouse.add(persons: robb, arya)
        XCTAssertNotEqual(starkHouse.sortedMembers, [robb, arya])
    }
}
