//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 18/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

class MemberListViewController: UITableViewController {

    // MARK: - Properties
    var model: [Person]
    
    // Mark: - Initialization
    init(model: [Person]) {
        self.model = model
        super.init(style: .plain)
        title = MEMBERS_TITLE
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Subscribe to notification
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(houseDidChange),
                                       name: NSNotification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME),
                                       object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Unsubscribe from notification
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification) {
        guard let info = notification.userInfo else {
            return
        }
        
        let house = info[HOUSE_KEY] as! House
        
        model = house.sortedMembers        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        
        let person = model[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)

        // Configure the cell...
        cell.textLabel?.text = person.fullName

        return cell
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the model
        let person = model[indexPath.row]
        
        // Get the view controller for the model to push
        let memberVC = MemberDetailViewController(model: person)
        
        navigationController?.pushViewController(memberVC, animated: true)
    }
}
