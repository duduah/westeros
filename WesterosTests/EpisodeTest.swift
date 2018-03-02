//
//  EpisodeTest.swift
//  WesterosTests
//
//  Created by Diego Gay Saez on 25/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import XCTest

@testable import Westeros

class EpisodeTest: XCTestCase {

    // MARK: - Properties
    var seasons: [Season]!
    var season1: Season!
    var season7: Season!
    
    var seasonEpisodes: [Episode]!
    
    var seasonEpisode: Episode!
    var season1Episode1: Episode!
    var season1Episode2: Episode!
    var season7Episode1: Episode!
    var season7Episode2: Episode!
    
    override func setUp() {
        super.setUp()
        
        season1 = Season(seasonName: "Season 1. Game of Thrones",
                             numberOfEpisodes: 10,
                             launchingDate: String.getDateFor(day: "17",
                                                              month: "04",
                                                              year: "2011"))
        season1Episode1 = Episode(title: "Winter is Coming",
                                      releaseDate: String.getDateFor(day: "17",
                                                                       month: "04",
                                                                       year: "2011"),
                                      season: season1)
        season1Episode2 = Episode(title: "The Kingsroad",
                                      releaseDate: String.getDateFor(day: "24",
                                                                       month: "04",
                                                                       year: "2011"),
                                      season: season1)

        season7 = Season(seasonName: "Season 7.",
                             numberOfEpisodes: 7,
                             launchingDate: String.getDateFor(day: "16",
                                                              month: "07",
                                                              year: "2017"))
        season7Episode1 = Episode(title: "Dragonstone",
                                      releaseDate: String.getDateFor(day: "16",
                                                                       month: "07",
                                                                       year: "2017"),
                                      season: season7)
        season7Episode2 = Episode(title: "Stormborn",
                                      releaseDate: String.getDateFor(day: "23",
                                                                       month: "07",
                                                                       year: "2017"),
                                      season: season7)

    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeExistance() {
        XCTAssertNotNil(season1Episode1)
        XCTAssertNotNil(season7Episode1)
    }
    
    func testEpisodeEquality() {
        // Identity
        XCTAssertEqual(season7Episode1, season7Episode1)
        
        // Equality
        let anotherEpisode = Episode(title: "Another Dragonstone",
                                     releaseDate: String.getDateFor(day: "16",
                                                                      month: "07",
                                                                      year: "2017"),
                                     season: season7)
        XCTAssertEqual(season7Episode1, anotherEpisode)

        // Non Equality
        XCTAssertNotEqual(season7Episode1, season7Episode2)
    }
    
    func testEpisodeHashable() {
        XCTAssertNotNil(season1Episode1.hashValue)
        XCTAssertNotNil(season7Episode1.hashValue)
    }
    
    func testEpisodeComperison() {
        XCTAssertGreaterThan(season1Episode2, season1Episode1)
        XCTAssertGreaterThan(season7Episode1, season1Episode1)
    }
    
    func testEpisodeDescription() {
        XCTAssertNotNil(season1Episode1.description)
        XCTAssertGreaterThan(season1Episode1.description.count, 0)
    }
}
