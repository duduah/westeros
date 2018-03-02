//
//  Utils.swift
//  Westeros
//
//  Created by Diego Gay Saez on 28/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//
import UIKit


// MARK: - Constants
let APP_TITLE = "Westeros"
let SEASONS_LISTVC_TITLE = "Seasons"

let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"
let HOUSE_KEY = "HouseKey"
let LAST_HOUSE = "LastHouse"

let SEASON_DID_CHANGE_NOTIFICATION_NAME = "SeasonDidChange"
let SEASON_KEY = "SeasonKey"
let LAST_SEASON = "LastSeason"



// MARK: - Common methods
func saveLastSelected(at row: Int, forKey: String) {
    let defaults = UserDefaults.standard
    defaults.set(row, forKey: forKey)
    
    // Por si las moscas, hay una manera de guardar la información
    defaults.synchronize()
}
