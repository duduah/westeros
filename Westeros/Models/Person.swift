//
//  Character.swift
//  Westeros
//
//  Created by Diego Gay Saez on 08/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import Foundation

final class Person {
    let name: String
    let house: House
    private let _alias: String?
    var alias: String {
        return _alias ?? ""
//        if let _alias = _alias {
//            // Existe y está en _alias
//            return _alias
//        } else {
//            return ""
//        }
    }
    
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
}

extension Person {
    var fullName: String {
        return "\(name) \(house.name)"
    }
}

// MARK - Proxies
extension Person {
    var proxy: String {
        return "\(name) \(alias) \(house.name)"
    }
}

// MARK - Hashable
extension Person: Hashable {
    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
    
    
}

