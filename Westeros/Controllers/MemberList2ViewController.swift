//
//  MemberList2ViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 19/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

class MemberList2ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var model: [Person]

    // MARK: - Initialization
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = appTitles.membersTitle.rawValue
    }
    
    init(model: [Person], membersListTitle: appTitles) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = membersListTitle.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Asignamos fuente de datos
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        subscriteToDefaultNotification(self,
                                       selector: #selector(houseDidChange),
                                       name: HOUSE_DID_CHANGE_NOTIFICATION_NAME)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromDefaultNotification(self)
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification) {
        guard let info = notification.userInfo else {
            return
        }
        
        let house = info[NotificationKeys.house.rawValue] as? House
        model = (house?.sortedMembers)!

        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension MemberList2ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        
        // Descubrir la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        // Preguntar por una celda (a caché) o crearla
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Sincronizar celda y persona
        cell.textLabel?.text = person.fullName
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MemberList2ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the model
        let person = model[indexPath.row]

        // Get the view controller for the model to push
        let memberDetailVC = MemberDetailViewController(model: person)

        navigationController?.pushViewController(memberDetailVC, animated: true)
    }
}

