//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 02/03/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var memberHouseLabel: UILabel!
    @IBOutlet weak var memberAliasLabel: UILabel!
    
    // MARK: - Properties
    var model: Person
    
    // MARK: - Initialization
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        // Título para vistas de navigation/tabbar...
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Subscribe to notifications
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(houseDidChange),
                                       name: NSNotification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME),
                                       object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Unsubscribe from notifications
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

    // MARK: - Sync
    func syncModelWithView() {
        memberNameLabel.text = model.name
        memberHouseLabel.text = model.house?.name
        memberAliasLabel.text = model.alias
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification) {
        // get userInfo from notification
        guard let info = notification.userInfo else {
            return
        }
        
        let house = info[NotificationKeys.house.rawValue] as? House
        guard let member = house?.sortedMembers.first else {
            navigationController?.popViewController(animated: true)
            return
        }
        model = member
        
        syncModelWithView()
    }
}
