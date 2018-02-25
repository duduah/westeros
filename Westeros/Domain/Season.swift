//
//  Season.swift
//  Westeros
//
//  Created by Diego Gay Saez on 22/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>

final class Season {
    
    // MARK: - Properties
    let name: String
    let launchingDate: Date
    // Total de episodios de la temporada
    let totalNumberOfEpisodes: Int
    private var _episodes: Episodes

    // MARK: - Initialization
    init(seasonName name: String,
         numberOfEpisodes totalNumberOfEpisodes: Int,
         launchingDate: Date) {
        self.name = name
        self.launchingDate = launchingDate
        self.totalNumberOfEpisodes = totalNumberOfEpisodes
        self._episodes = Episodes()
    }
}

extension Season {
    // Número de instancias de Episodios asociados a la temporada
    var numberOfEpisodes: Int {
        return _episodes.count
    }

    var sortedEpisodes: [Episode] {
        return _episodes.sorted()
    }

    func add(episode: Episode) {
        guard episode.season == self else {
            return
        }
        
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...) {
        episodes.forEach { add(episode: $0) }
    }
}

// MARK: - Proxies
extension Season {
    var proxy: Date {
        return launchingDate
    }
}

// MARK: - Protocols
extension Season: Hashable {
    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}

extension Season: CustomStringConvertible {
    var description: String {
        return name
    }
}
