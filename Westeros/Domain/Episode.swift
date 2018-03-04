//
//  Episode.swift
//  Westeros
//
//  Created by Diego Gay Saez on 22/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import Foundation

// MARK: - Episode
final class Episode {
    
    // MARK: - Properties
    let title: String
    let releaseDate: Date
    let director: [String]
    let scriptWriter: [String]
    let plot: String
    weak var season: Season?
    
    // MARK: - Initialization
    init(title: String, releaseDate: Date, director: [String], scriptWriter: [String], plot: String, season: Season) {
        self.title = title
        self.releaseDate = releaseDate
        self.director = director
        self.scriptWriter = scriptWriter
        self.plot = plot
        self.season = season
        season.add(episode: self)
    }
}

// MARK: - Proxies
extension Episode {
    var proxy: Date {
        return self.releaseDate
    }
}

// MARK: - Protocols
extension Episode: Hashable {
    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}

extension Episode: CustomStringConvertible {
    var description: String {
        guard let theSeason = season else {
            return "Title: '\(title)'"
        }

        return "Title: '\(title)'. Season: '\(theSeason.name)'"
    }
    
    
}


