//
//  Repository.swift
//  Westeros
//
//  Created by Diego Gay Saez on 13/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

typealias HouseFilter = (House) -> Bool
typealias SeasonFilter = (Season) -> Bool

// final para que no se pueda heredar de esta clase. Si hiciese falta, se quita.
final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    var houses: [House] { get }
    var seasons: [Season] { get }
    func house(named: String) -> House?
    func houses(filteredBy: HouseFilter) -> [House]
    func seasons(filteredBy: SeasonFilter) -> [Season]
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
    
    var seasons: [Season] {
        let season1 = Season(seasonName: "Season 1. Game of Thrones",
                             numberOfEpisodes: 10,
                             launchingDate: String.getDateFor(day: "17",
                                                              month: "04",
                                                              year: "2011"))
        let season1Episode1 = Episode(title: "Winter is Coming",
                                      releaseDate: String.getDateFor(day: "17",
                                                                       month: "04",
                                                                       year: "2011"),
                                      season: season1)
        let season1Episode2 = Episode(title: "The Kingsroad",
                                      releaseDate: String.getDateFor(day: "24",
                                                                       month: "04",
                                                                       year: "2011"),
                                      season: season1)
        let season1Episode3 = Episode(title: "Lord Snow",
                                      releaseDate: String.getDateFor(day: "01",
                                                                       month: "05",
                                                                       year: "2011"),
                                      season: season1)
        season1.add(episodes: season1Episode1, season1Episode2, season1Episode3)
        
        let season2 = Season(seasonName: "Season 2. A Clash of Kings",
                             numberOfEpisodes: 10,
                             launchingDate: String.getDateFor(day: "01",
                                                              month: "04",
                                                              year: "2012"))
        let season2Episode1 = Episode(title: "The North Remembers",
                                      releaseDate: String.getDateFor(day: "01",
                                                                       month: "04",
                                                                       year: "2012"),
                                      season: season2)
        let season2Episode2 = Episode(title: "Nightlands",
                                      releaseDate: String.getDateFor(day: "08",
                                                                       month: "04",
                                                                       year: "2012"),
                                      season: season2)
        season2.add(episodes: season2Episode1, season2Episode2)
        
        let season3 = Season(seasonName: "Season 3. A Storm of Swords 1/2",
                             numberOfEpisodes: 10,
                             launchingDate: String.getDateFor(day: "31",
                                                              month: "03",
                                                              year: "2013"))
        let season3Episode1 = Episode(title: "Valar Dohaeris",
                                      releaseDate: String.getDateFor(day: 31,
                                                                       month: .march,
                                                                       year: 2013),
                                      season: season3)
        let season3Episode2 = Episode(title: "Dark Wings, Dark Words",
                                      releaseDate: String.getDateFor(day: 7,
                                                                       month: .april,
                                                                       year: 2013),
                                      season: season3)
        let season3Episode3 = Episode(title: "Walk of Punishment",
                                      releaseDate: String.getDateFor(day: 14,
                                                                       month: .april,
                                                                       year: 2013),
                                      season: season3)
        season3.add(episodes: season3Episode1, season3Episode2, season3Episode3)
        
        let season4 = Season(seasonName: "Season 4. A Storm of Swords 2/2",
                             numberOfEpisodes: 10,
                             launchingDate: String.getDateFor(day: "06",
                                                              month: "04",
                                                              year: "2014"))
        let season4Episode1 = Episode(title: "Two Swords",
                                      releaseDate: String.getDateFor(day: "06",
                                                                       month: "04",
                                                                       year: "2014"),
                                      season: season4)
        let season4Episode2 = Episode(title: "The Lion and the Rose",
                                      releaseDate: String.getDateFor(day: "13",
                                                                       month: "04",
                                                                       year: "2014"),
                                      season: season4)
        let season4Episode3 = Episode(title: "Breaker of Chains",
                                      releaseDate: String.getDateFor(day: "20",
                                                                       month: "04",
                                                                       year: "2014"),
                                      season: season4)
        season4.add(episodes: season4Episode1, season4Episode2, season4Episode3)
        
        let season5 = Season(seasonName: "Season 5. A Feast for Crows",
                             numberOfEpisodes: 10,
                             launchingDate: String.getDateFor(day: "12",
                                                              month: "04",
                                                              year: "2015"))
        let season5Episode1 = Episode(title: "The Wars to Come",
                                      releaseDate: String.getDateFor(day: "12",
                                                                       month: "04",
                                                                       year: "2015"),
                                      season: season5)
        let season5Episode2 = Episode(title: "The House of Black and White",
                                      releaseDate: String.getDateFor(day: "19",
                                                                       month: "04",
                                                                       year: "2015"),
                                      season: season5)
        season5.add(episodes: season5Episode1, season5Episode2)

        let season6 = Season(seasonName: "Season 6. A Song of Ice and Fire",
                             numberOfEpisodes: 10,
                             launchingDate: String.getDateFor(day: "24",
                                                              month: "04",
                                                              year: "2016"))
        let season6Episode1 = Episode(title: "The Red Woman",
                                      releaseDate: String.getDateFor(day: "24",
                                                                       month: "04",
                                                                       year: "2016"),
                                      season: season6)
        let season6Episode2 = Episode(title: "Home",
                                      releaseDate: String.getDateFor(day: "01",
                                                                       month: "05",
                                                                       year: "2016"),
                                      season: season6)
        let season6Episode3 = Episode(title: "Oathbreaker",
                                      releaseDate: String.getDateFor(day: "08",
                                                                       month: "05",
                                                                       year: "2016"),
                                      season: season6)
        let season6Episode4 = Episode(title: "Book of the Stranger",
                                      releaseDate: String.getDateFor(day: "15",
                                                                       month: "05",
                                                                       year: "2016"),
                                      season: season6)
        season6.add(episodes: season6Episode1, season6Episode2, season6Episode3, season6Episode4)

        let season7 = Season(seasonName: "Season 7.",
                             numberOfEpisodes: 7,
                             launchingDate: String.getDateFor(day: "16",
                                                              month: "07",
                                                              year: "2017"))
        let season7Episode1 = Episode(title: "Dragonstone",
                                      releaseDate: String.getDateFor(day: "16",
                                                                       month: "07",
                                                                       year: "2017"),
                                      season: season7)
        let season7Episode2 = Episode(title: "Stormborn",
                                      releaseDate: String.getDateFor(day: "23",
                                                                       month: "07",
                                                                       year: "2017"),
                                      season: season7)
        let season7Episode3 = Episode(title: "The Queen's Justice",
                                      releaseDate: String.getDateFor(day: "30",
                                                                       month: "07",
                                                                       year: "2017"),
                                      season: season7)
        let season7Episode4 = Episode(title: "The Spoils of War",
                                      releaseDate: String.getDateFor(day: "06",
                                                                       month: "08",
                                                                       year: "2017"),
                                      season: season7)
        let season7Episode5 = Episode(title: "Eastwatch",
                                      releaseDate: String.getDateFor(day: "13",
                                                                       month: "08",
                                                                       year: "2017"),
                                      season: season7)
        let season7Episode6 = Episode(title: "Beyond the Wall",
                                      releaseDate: String.getDateFor(day: "20",
                                                                       month: "08",
                                                                       year: "2017"),
                                      season: season7)
        let season7Episode7 = Episode(title: "The Dragon and the Wolf",
                                      releaseDate: String.getDateFor(day: "27",
                                                                       month: "08",
                                                                       year: "2017"),
                                      season: season7)
        season7.add(episodes: season7Episode1, season7Episode2, season7Episode3, season7Episode4, season7Episode5, season7Episode6, season7Episode7)
        
        return [season1, season2, season3, season4, season5, season6, season7].sorted()
    }
    
    func house(named name: String) -> House? {
//        return houses.filter{ $0.name.uppercased() == name.uppercased() }.first
        return houses.first{ $0.name.uppercased() == name.uppercased() }
    }

    func houses(filteredBy: HouseFilter) -> [House] {
        return houses.filter(filteredBy)
    }
    
    func seasons(filteredBy: SeasonFilter) -> [Season] {
        return seasons.filter(filteredBy)
    }
    
    func appModels() -> (houseList: HouseListViewController, houseDetail: HouseDetailViewController,
        seasonList: SeasonListViewController, seasonDetail: SeasonDetailViewController) {
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
//        let episodes = seasons.first?.sortedEpisodes
//        let seasonTitleForEpisodes = seasons.first?.name
        
//        var listDetailArray: [(UIViewController, UIViewController)] = []
        
        // Creamos los controladores
        let houseListVC = HouseListViewController(model: houses)
        let houseDetailVC = HouseDetailViewController(model: houseListVC.lastRowSelected())
        houseListVC.delegate = houseDetailVC
//        listDetailArray.append((houseListVC, houseDetailVC))

        let seasonListVC = SeasonListViewController(model: seasons)
        let seasonDetailVC = SeasonDetailViewController(model: seasonListVC.lastRowSelected())
        seasonListVC.delegate = seasonDetailVC
//        listDetailArray.append((seasonListVC, seasonDetailVC))

//        return listDetailArray
        return (houseListVC,
                houseDetailVC,
                seasonListVC,
                seasonDetailVC)
    }
}
