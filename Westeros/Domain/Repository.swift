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
    func house(named: HousesOfWesteros) -> House?
    func houses(filteredBy: HouseFilter) -> [House]
    func seasons(filteredBy: SeasonFilter) -> [Season]
}

final class LocalFactory: HouseFactory {
    var houses: [House] {
        // Houses creation here
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Huargo Wolf")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Lion")
        let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Dragon Tricefalo")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!)
        let lannisterHouse = House(name: "Lanister", sigil: lannisterSigil, words: "We will kill you all", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
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
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
    }
    
    var seasons: [Season] {
        let season1 = Season(seasonName: "Season 1. Game of Thrones",
                             numberOfEpisodes: 10,
                             releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 17)),
                             plot: """
Season 1 spans a period of several months on a world where the seasons last for years at a time. The action begins in the unified Seven Kingdoms of Westeros as the long summer ends and winter draws near. Lord Eddard Stark is asked by his old friend, King Robert Baratheon, to serve as the King's Hand following the death of the previous incumbent, Eddard's mentor Jon Arryn. Eddard is reluctant, but receives intelligence suggesting that Jon was murdered. Eddard accepts Robert's offer, planning to use his position and authority to investigate the alleged murder.

Meanwhile, on the eastern continent of Essos, the exiled children of House Targaryen, which Robert destroyed to claim the throne, are plotting to return to Westeros and unseat the 'usurper'. To this end, Viserys Targaryen arranges the marriage of his sister Daenerys to Khal Drogo, the leader of 40,000 Dothraki warriors, in return for the use of his warriors in invading Westeros. For her part, Daenerys just wants to find a safe refuge far away from King Robert's assassins and her brother's scheming ambition.

Finally, on the northern-most border of the Seven Kingdoms the sworn brothers of the Night's Watch guard the Wall, a 300-mile-long colossal fortification of ice which has stood for thousands of years. The Watch defends the Wall against the depredations of the lawless wildlings who live beyond, but rumour speaks of a new threat arising in the lands of perpetual winter.
""")
        let season1Episode1 = Episode(title: "Winter is Coming",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 17)),
                                      director: ["Tim Van Patten"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: """
A Night's Watch deserter is tracked down outside of Winterfell, prompting swift justice by Lord Eddard “Ned” Stark and raising concerns about the dangers in the lawless lands north of the Wall. Returning home, Ned learns from his wife Catelyn that his mentor, Jon Arryn, has died in the Seven Kingdoms capital of King's Landing, and that King Robert is on his way north to offer Ned Arryn's position as the King's Hand. Meanwhile, across the Narrow Sea in Pentos, the exiled Prince Viserys Targaryen hatches a plan to win back the throne, which entails forging an allegiance with the savage nomadic Dothraki warriors by giving its leader, Khal Drogo, his lovely sister Daenerys' hand in marriage in exchange for Drogo's army. Back in Winterfell, Robert arrives at Winterfell with his wife, Queen Cersei, and other members of the Lannister family: her twin brother Jaime, dwarf brother Tyrion and Cersei’s son and heir to the throne, 12-year-old Joffrey. Ned's wife Catelyn receives a clue that may implicate members of the royal family in a murder, and their young son Bran makes a jaw-dropping discovery.
""",
                                      season: season1)
        let season1Episode2 = Episode(title: "The Kingsroad",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 4, day: 24)),
                                      director: ["Tim Van Patten"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season1)
        let season1Episode3 = Episode(title: "Lord Snow",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2011, month: 5, day: 1)),
                                      director: ["Brian Kirk"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season1)
        season1.add(episodes: season1Episode1, season1Episode2, season1Episode3)
        
        let season2 = Season(seasonName: "Season 2. A Clash of Kings",
                             numberOfEpisodes: 10,
                             releaseDate: Date.getDateFor(date: .yyyyMd(year: 2012, month: 4, day: 1)),
                             plot: """
Season 2 spans several months on a world where the seasons last for years at a time. The Seven Kingdoms are at war, with the King in the North, Robb Stark, fighting to win independence for his people. Robb decides that he must win the allegiance of the fiercely independent ironborn to his cause, and sends his best friend Theon Greyjoy to treat with his father. Meanwhile, Joffrey Baratheon holds the Iron Throne with the backing of the powerful House Lannister, but his uncle Renly has also claimed the throne with the support of House Tyrell, whose armies are much larger. As they struggle for the throne, Tyrion Lannister arrives in King's Landing to take matters in hand.

However, there is another faction entering the picture. Stannis Baratheon, Robert's younger brother and Renly's older, has also claimed the Iron Throne. A proven battle commander and veteran of several wars, Stannis is known to be utterly without mercy to his enemies and will do what is right even if it destroys him. Advising him is Melisandre, an enigmatic priestess from the east, who believes Stannis is meant for a greater destiny, and Ser Davos Seaworth, an honest and honorable man uneasy with the shift in power at Stannis' court.

Far to the east, Daenerys Targaryen has hatched the only three dragons in the world. Eventually they will grow into terrifying monsters capable of destroying cities at her command, but for now they are still hatchlings and vulnerable. With her khalasar gone, Daenerys and her small band of followers must find a way across a forbidding wasteland and find new allies to support her claim to the Iron Throne.
""")
        let season2Episode1 = Episode(title: "The North Remembers",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2012, month: 4, day: 1)),
                                      director: ["Alan Taylor"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season2)
        let season2Episode2 = Episode(title: "Nightlands",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2012, month: 4, day: 8)),
                                      director: ["Alan Taylor"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season2)
        season2.add(episodes: season2Episode1, season2Episode2)
        
        let season3 = Season(seasonName: "Season 3. A Storm of Swords 1/2",
                             numberOfEpisodes: 10,
                             releaseDate: Date.getDateFor(date: .yyyyMd(year: 2013, month: 3, day: 31)),
                             plot: "Plot season 3")
        let season3Episode1 = Episode(title: "Valar Dohaeris",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2013, month: 3, day: 31)),
                                      director: ["Daniel Minahan"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season3)
        let season3Episode2 = Episode(title: "Dark Wings, Dark Words",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2013, month: 4, day: 7)),
                                      director: ["Daniel Minahan"],
                                      scriptWriter: ["Vanessa Taylor"],
                                      plot: "asdf",
                                      season: season3)
        let season3Episode3 = Episode(title: "Walk of Punishment",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2013, month: 4, day: 14)),
                                      director: ["David Benioff", "D. B. Weiss"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season3)
        season3.add(episodes: season3Episode1, season3Episode2, season3Episode3)
        
        let season4 = Season(seasonName: "Season 4. A Storm of Swords 2/2",
                             numberOfEpisodes: 10,
                             releaseDate: Date.getDateFor(date: .yyyyMd(year: 2014, month: 4, day: 6)),
                             plot: "Plot season 4")
        let season4Episode1 = Episode(title: "Two Swords",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2014, month: 4, day: 6)),
                                      director: ["D. B. Weiss"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season4)
        let season4Episode2 = Episode(title: "The Lion and the Rose",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2014, month: 4, day: 13)),
                                      director: ["Alex Graves"],
                                      scriptWriter: ["George R. R. Martin"],
                                      plot: "asdf",
                                      season: season4)
        let season4Episode3 = Episode(title: "Breaker of Chains",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2014, month: 4, day: 20)),
                                      director: ["Alex Graves"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season4)
        season4.add(episodes: season4Episode1, season4Episode2, season4Episode3)
        
        let season5 = Season(seasonName: "Season 5. A Feast for Crows",
                             numberOfEpisodes: 10,
                             releaseDate: Date.getDateFor(date: .yyyyMd(year: 2015, month: 4, day: 12)),
                             plot: "Plot season 5")
        let season5Episode1 = Episode(title: "The Wars to Come",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2015, month: 4, day: 12)),
                                      director: ["Michael Slovis"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season5)
        let season5Episode2 = Episode(title: "The House of Black and White",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2015, month: 4, day: 19)),
                                      director: ["Michael Slovis"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season5)
        season5.add(episodes: season5Episode1, season5Episode2)

        let season6 = Season(seasonName: "Season 6. A Song of Ice and Fire",
                             numberOfEpisodes: 10,
                             releaseDate: Date.getDateFor(date: .yyyyMd(year: 2016, month: 4, day: 24)),
                             plot: "Plot season 6")
        let season6Episode1 = Episode(title: "The Red Woman",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2016, month: 4, day: 24)),
                                      director: ["Jeremy Podeswa"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season6)
        let season6Episode2 = Episode(title: "Home",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2016, month: 5, day: 1)),
                                      director: ["Jeremy Podeswa"],
                                      scriptWriter: ["Dave Hill"],
                                      plot: "asdf",
                                      season: season6)
        let season6Episode3 = Episode(title: "Oathbreaker",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2016, month: 5, day: 8)),
                                      director: ["Daniel Sackheim"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season6)
        let season6Episode4 = Episode(title: "Book of the Stranger",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2016, month: 5, day: 15)),
                                      director: ["Daniel Sackheim"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season6)
        season6.add(episodes: season6Episode1, season6Episode2, season6Episode3, season6Episode4)

        let season7 = Season(seasonName: "Season 7.",
                             numberOfEpisodes: 7,
                             releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 16)),
                             plot: "Plot season 7")
        let season7Episode1 = Episode(title: "Dragonstone",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 16)),
                                      director: ["Jeremy Podeswa"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season7)
        let season7Episode2 = Episode(title: "Stormborn",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 23)),
                                      director: ["Mark Mylod"],
                                      scriptWriter: ["Bryan Cogman"],
                                      plot: "asdf",
                                      season: season7)
        let season7Episode3 = Episode(title: "The Queen's Justice",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 7, day: 30)),
                                      director: ["Mark Mylod"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season7)
        let season7Episode4 = Episode(title: "The Spoils of War",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 8, day: 6)),
                                      director: ["Matt Shakman"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season7)
        let season7Episode5 = Episode(title: "Eastwatch",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 8, day: 13)),
                                      director: ["Matt Shakman"],
                                      scriptWriter: ["Dave Hill"],
                                      plot: "asdf",
                                      season: season7)
        let season7Episode6 = Episode(title: "Beyond the Wall",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 8, day: 20)),
                                      director: ["Alan Taylor"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season7)
        let season7Episode7 = Episode(title: "The Dragon and the Wolf",
                                      releaseDate: Date.getDateFor(date: .yyyyMd(year: 2017, month: 8, day: 27)),
                                      director: ["Jeremy Podeswa"],
                                      scriptWriter: ["David Benioff", "D. B. Weiss"],
                                      plot: "asdf",
                                      season: season7)
        season7.add(episodes: season7Episode1, season7Episode2, season7Episode3, season7Episode4, season7Episode5, season7Episode6, season7Episode7)
        
        return [season1, season2, season3, season4, season5, season6, season7].sorted()
    }
    
    func house(named name: String) -> House? {
        return houses.first{ $0.name.uppercased() == name.uppercased() }
    }
    
    func house(named name: HousesOfWesteros) -> House? {
        return houses.first{ $0.name.uppercased() == name.rawValue.uppercased()}
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
