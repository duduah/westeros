//
//  Utils.swift
//  Westeros
//
//  Created by Diego Gay Saez on 28/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//
import UIKit


// MARK: - Constants for navigation/tabBar titles
enum appTitles: String {
    case appTitle = "Westeros"
    case seasonsTitle = "Seasons"
    case episodesTitle = "Episodes"
    case membersTitle = "Members"
    case wikiTitle = "Wiki"
}

// MARK: - Constants for saving in user defaults
enum UserDefaultKeys: String {
    case house = "LastHouse"
    case season = "LastSeason"
    case episode = "LastEpisode"
}

// MARK: - Constants for notifications
enum NotificationKeys: String {
    case house = "HouseKey"
    case season = "SeasonKey"
    case episode = "EpisodeKey"
}

let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"

let SEASON_DID_CHANGE_NOTIFICATION_NAME = "SeasonDidChange"
let LAST_SEASON = "LastSeason"

let LAST_EPISODE = "LastEpisode"

// MARK: - Enums

/**
 List of houses in Westeros
 */
enum HousesOfWesteros: String {
    case Stark, Lanister, Targaryen
}

// MARK: - UserDefaults
/**
 This function saves the row index and the section (0 by now) of the UITableViewController param in the UserDefaults standard area.
 
 **Important**: this is to save light weight data. Don't save objects from the model or so.

 Usage:
 
        saveLastSelected(at: indexPath.row, forKey: "LastSeason")
 
 - Parameters:
    - row: the index of de table view to be saved.
    - forKey: the key to identify it.
 */
func saveLastSelected(at row: Int, forKey: UserDefaultKeys) {
    let defaults = UserDefaults.standard
    defaults.set(row, forKey: forKey.rawValue)
    
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
func selectLastSelectedRowFromUserDefaults(in tableVC: UITableViewController, withKey key: UserDefaultKeys) {
    let lastRowSelected = UserDefaults.standard.integer(forKey: key.rawValue)
    let indexPath = IndexPath(row: lastRowSelected, section: 0)
    
    tableVC.tableView.selectRow(at: indexPath,
                             animated: true,
                             scrollPosition: .top)
}

// MARK: - Notificatios
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

