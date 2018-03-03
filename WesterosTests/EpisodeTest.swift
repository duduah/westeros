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
                         releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 17)),
                         plot: "Plot season 1")
        season1Episode1 = Episode(title: "Winter is Coming",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 17)),
                                      director: ["Tim Van Patten"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "Plot season 1, episode 1",
                                      season: season1)
        season1Episode2 = Episode(title: "The Kingsroad",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 24)),
                                      director: ["Tim Van Patten"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "Plot season 1, episode 2",
                                      season: season1)
        
        season7 = Season(seasonName: "Season 7.",
                             numberOfEpisodes: 7,
                             releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 16)),
                             plot: "Plot season 7")
        season7Episode1 = Episode(title: "Dragonstone",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 16)),
                                      director: ["Jeremy Podeswa"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season7)
        season7Episode2 = Episode(title: "Stormborn",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 23)),
                                      director: ["Mark Mylod"],
                                      scriptWriter: ["Bryan Cogman"],
                                      plot: "asdf",
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
                                     releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 16)),
                                     director: ["Mark Mylod"],
                                     scriptWriter: ["Bryan Cogman"],
                                     plot: "Plot another episode",
                                     season: season7)
        print(season7Episode1.releaseDate)
        XCTAssertEqual(season7Episode1, anotherEpisode)

        // Non Equality
        XCTAssertNotEqual(season7Episode1, season7Episode2)
    }
    
    func testEpisodeHashable() {
        XCTAssertNotNil(season1Episode1.hashValue)
        XCTAssertNotNil(season7Episode1.hashValue)
    }
    
    func testEpisodeComparison() {
        XCTAssertGreaterThan(season1Episode2, season1Episode1)
        XCTAssertGreaterThan(season7Episode1, season1Episode1)
    }
    
    func testEpisodeDescription() {
        XCTAssertNotNil(season1Episode1.description)
        XCTAssertGreaterThan(season1Episode1.description.count, 0)
    }
}
