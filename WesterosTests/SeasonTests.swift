//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Diego Gay Saez on 24/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import XCTest

@testable import Westeros

class SeasonTests: XCTestCase {
    
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
                                  dateBroadcast: String.getDateFor(day: "17",
                                                                   month: "04",
                                                                   year: "2011"),
                                  season: season1)
        season1Episode2 = Episode(title: "The Kingsroad",
                                  dateBroadcast: String.getDateFor(day: "24",
                                                                   month: "04",
                                                                   year: "2011"),
                                  season: season1)
        
        season7 = Season(seasonName: "Season 7.",
                         numberOfEpisodes: 7,
                         launchingDate: String.getDateFor(day: "16",
                                                          month: "07",
                                                          year: "2017"))
        season7Episode1 = Episode(title: "Dragonstone",
                                  dateBroadcast: String.getDateFor(day: "16",
                                                                   month: "07",
                                                                   year: "2017"),
                                  season: season7)
        season7Episode2 = Episode(title: "Stormborn",
                                  dateBroadcast: String.getDateFor(day: "23",
                                                                   month: "07",
                                                                   year: "2017"),
                                  season: season7)
        
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(season1)
        XCTAssertNotNil(season7)
    }
    
    func testSeasonEquality() {
        // Identity
        XCTAssertEqual(season1, season1)
        
        // Equality
        let otraSeason = Season(seasonName: "Season 1. Game of Thrones",
                                numberOfEpisodes: 10,
                                launchingDate: String.getDateFor(day: "17",
                                                                 month: "04",
                                                                 year: "2011"))
        XCTAssertEqual(season1, otraSeason)
        
        // Non equality
        XCTAssertNotEqual(season1, season7)
    }
    
    func testSeasonHashable() {
        XCTAssertNotNil(season1.hashValue)
        XCTAssertNotNil(season7.hashValue)
    }
    
    func testSeasonComparison() {
        XCTAssertLessThan(season1, season7)
        XCTAssertGreaterThan(season7, season1)
    }
    
    func testSeasonDescription() {
        XCTAssertNotNil(season1.description)
        XCTAssertGreaterThan(season7.description.count, 0)
    }
    
    func testAddEpisodes() {
        season1.add(episode: season1Episode1)
        XCTAssertEqual(season1.sortedEpisodes.count, 1)

        season1.add(episode: season1Episode1)
        XCTAssertEqual(season1.sortedEpisodes.count, 1)

        season1.add(episode: season1Episode2)
        XCTAssertEqual(season1.sortedEpisodes.count, 2)
        
        season7.add(episodes: season7Episode1, season7Episode2, season7Episode2)
        XCTAssertEqual(season7.sortedEpisodes.count, 2)
    }
}
