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
    
//    var seasonEpisode: Episode!
//    var season1Episode1: Episode!
//    var season1Episode2: Episode!
//    var season7Episode1: Episode!
//    var season7Episode2: Episode!
    
    override func setUp() {
        super.setUp()
        
        season1 = Season(seasonName: "Season 1. Game of Thrones",
                         numberOfEpisodes: 10,
                         releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 17)),
                         plot: "Plot season 1")
        _ = Episode(title: "Winter is Coming",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 17)),
                                      director: ["Tim Van Patten"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: """
A Night's Watch deserter is tracked down outside of Winterfell, prompting swift justice by Lord Eddard “Ned” Stark and raising concerns about the dangers in the lawless lands north of the Wall. Returning home, Ned learns from his wife Catelyn that his mentor, Jon Arryn, has died in the Seven Kingdoms capital of King's Landing, and that King Robert is on his way north to offer Ned Arryn's position as the King's Hand. Meanwhile, across the Narrow Sea in Pentos, the exiled Prince Viserys Targaryen hatches a plan to win back the throne, which entails forging an allegiance with the savage nomadic Dothraki warriors by giving its leader, Khal Drogo, his lovely sister Daenerys' hand in marriage in exchange for Drogo's army. Back in Winterfell, Robert arrives at Winterfell with his wife, Queen Cersei, and other members of the Lannister family: her twin brother Jaime, dwarf brother Tyrion and Cersei’s son and heir to the throne, 12-year-old Joffrey. Ned's wife Catelyn receives a clue that may implicate members of the royal family in a murder, and their young son Bran makes a jaw-dropping discovery.
""",
                                      season: season1)
        _ = Episode(title: "The Kingsroad",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 24)),
                                      director: ["Tim Van Patten"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "Plot season 1, episode 2",
                                      season: season1)

        season7 = Season(seasonName: "Season 7.",
                             numberOfEpisodes: 7,
                             releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 16)),
                             plot: "Plot season 7")
        _ = Episode(title: "Dragonstone",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 16)),
                                      director: ["Jeremy Podeswa"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season7)
        _ = Episode(title: "Stormborn",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 23)),
                                      director: ["Mark Mylod"],
                                      scriptWriter: ["Bryan Cogman"],
                                      plot: "asdf",
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
                                releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 17)),
                                plot: "Plot")
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
        XCTAssertEqual(season7.sortedEpisodes.count, 2)

        XCTAssertEqual(season1.sortedEpisodes.count, 2)
        
        _ = Episode(title: "Stormborn",
                                              releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 23)),
                                              director: ["Mark Mylod"],
                                              scriptWriter: ["Bryan Cogman"],
                                              plot: "asdf",
                                              season: season1)
        XCTAssertEqual(season1.sortedEpisodes.count, 3)
    }
}
