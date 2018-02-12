//
//  House.swift
//  Westeros
//
//  Created by Diego Gay Saez on 08/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

typealias Words = String

// Set no permite dos elementos iguales.
typealias Members = Set<Person>

// MARK: - House
final class House {
    let name: String
    let sigil: Sigil
    let words: Words
    private var _members: Members

    init(name: String, sigil: Sigil, words: Words) {
        self.name = name
        self.sigil = sigil
        self.words = words
        _members = Members()
    }
}

extension House {
    var count: Int {
        return _members.count
    }

    func add(person: Person) {
        guard person.house == self else {
            return
        }
        _members.insert(person)
    }
}

// MARK: - Proxy
extension House {
    var proxyForEquality: String {
        return "\(name) \(words) \(count)"
    }
    
    var proxyForComparison: String {
        return name.uppercased()
    }
}

// MARK: - Equatable
extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Hashable
extension House: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension House: Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

// MARK: - Sigil
final class Sigil {
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String) {
        self.image = image
        self.description = description
    }
}

