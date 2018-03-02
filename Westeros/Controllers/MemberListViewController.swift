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
    let model: [Person]
    
    // Mark: - Initialization
    init(model: [Person]) {
        self.model = model
        super.init(style: .plain)
        title = "Member"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        cell.textLabel?.text = person.alias

        return cell
    }

}
