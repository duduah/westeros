//
//  Repository.swift
//  Westeros
//
//  Created by Diego Gay Saez on 13/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import Foundation

// final para que no se pueda heredar de esta clase. Si hiciese falta, se quita.
final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    var houses: [House] { get }
}

final class LocalFactory: HouseFactory {
    var houses: [House] {
        // Houses creation here
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Huargo Wolf")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Lion")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
        let lannisterHouse = House(name: "Lanister", sigil: lannisterSigil, words: "We will kill you all")
        
        let robb = Person(name: "Robb", alias: "Young Wolf", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "Dwarf", house: lannisterHouse)
        let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)

        // Add characters to houses
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        starkHouse.add(person: ned)
        lannisterHouse.add(person: tyrion)
        return [starkHouse, lannisterHouse]
    }
}
