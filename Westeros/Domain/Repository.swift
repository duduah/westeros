//
//  Repository.swift
//  Westeros
//
//  Created by Diego Gay Saez on 13/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import Foundation

typealias Filter = (House) -> Bool

// final para que no se pueda heredar de esta clase. Si hiciese falta, se quita.
final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    var houses: [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
}

final class LocalFactory: HouseFactory {
    var houses: [House] {
        // Houses creation here
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Huargo Wolf")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Lion")
        let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Dragon Tricefalo")
        let miCasaSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Mi casa se pasa")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!)
        let lannisterHouse = House(name: "Lanister", sigil: lannisterSigil, words: "We will kill you all", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let diegoHouse = House(name: "Diego", sigil: miCasaSigil, words: "mi casa se pasa", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!)
        
        let robb = Person(name: "Robb", alias: "Young Wolf", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "Dwarf", house: lannisterHouse)
        let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)

        // Add characters to houses
        starkHouse.add(persons: arya, robb, ned)
        lannisterHouse.add(persons: tyrion, cersei, jaime)
        targaryenHouse.add(person: dani)
        
        return [starkHouse, lannisterHouse, targaryenHouse, diegoHouse].sorted()
    }
    
    func house(named name: String) -> House? {
//        return houses.filter{ $0.name.uppercased() == name.uppercased() }.first
        return houses.first{ $0.name.uppercased() == name.uppercased() }
    }

    func houses(filteredBy: Filter) -> [House] {
        return houses.filter(filteredBy)
    }
}
