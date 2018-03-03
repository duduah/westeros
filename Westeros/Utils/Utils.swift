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
let MEMBERS_TITLE = "Members"
let WIKI_TITLE = "Wiki"

let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"
let HOUSE_KEY = "HouseKey"
let LAST_HOUSE = "LastHouse"

let SEASON_DID_CHANGE_NOTIFICATION_NAME = "SeasonDidChange"
let SEASON_KEY = "SeasonKey"
let LAST_SEASON = "LastSeason"

let EPISODE_KEY = "EpisodeKey"
let LAST_EPISODE = "LastEpisode"

// MARK: - Enums

/**
 List os houses in Westeros
 */
enum HousesOfWesteros: String {
    case Stark, Lanister, Targaryen
}

// MARK: - Common methods

/**
 This function saves the row index of the UITableViewController param in the UserDefaults standard area.
 
 Usage:
 
        saveLastSelected(at: indexPath.row, forKey: "LastSeason")
 
 - Parameters:
    - row: the index of de table view to be saved.
    - forKey: the key to identify it.
 */
func saveLastSelected(at row: Int, forKey: String) {
    let defaults = UserDefaults.standard
    defaults.set(row, forKey: forKey)
    
    // Por si las moscas, hay una manera de guardar la información
    defaults.synchronize()
}

/**
 Select last selection of the table view controller saved in UserDefaults
 
 Usage:
 
        selectLastSelectedRowFromUserDefaults(in: self, withKey: SEASON_KEY)
 
 - Parameters:
    - tableVC: the table view to select the row in
    - key: the key to identify the index to load
 */
func selectLastSelectedRowFromUserDefaults(in tableVC: UITableViewController, withKey key: String) {
    let lastRowSelected = UserDefaults.standard.integer(forKey: key)
    let indexPath = IndexPath(row: lastRowSelected, section: 0)
    
    tableVC.tableView.selectRow(at: indexPath,
                             animated: true,
                             scrollPosition: .top)
}


/**
 Subscribes a view controller to default notification center.
 
 Usage:
 
        subscriteToDefaultNotification(self,
                                   selector: #selector(methodName),
                                   name: "NameOfNotification")

 - Parameters:
    - vc: view controller that will subscribe to notification
    - selector: the selector of the method to execute. That method must be implemented with the `methodName`.
    - name: name of the notification to subscribe to.
 */
func subscriteToDefaultNotification(_ vc: UIViewController, selector: Selector, name: String) {
    let notificationCenter = NotificationCenter.default
    notificationCenter.addObserver(vc,
                                   selector: selector,
                                   name: Notification.Name(name),
                                   object: nil)

}

/**
 Unsubscribe de view controller from the notification observer.
 
 - Parameter vc: the view controller that will unsubscribe from observer.
 */
func unsubscribeFromDefaultNotification(_ vc: UIViewController) {
    // Unsubscribe from notification
    let notificationCenter = NotificationCenter.default
    notificationCenter.removeObserver(vc)
}

