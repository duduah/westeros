//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 27/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

protocol SeasonListViewControllerDelegate: class {
    func seasonListViewController(_ vc: SeasonListViewController, didSelect season: Season)
}

class SeasonListViewController: UITableViewController {
    
    // MARK: - Properties
    let model: [Season]
    weak var delegate: SeasonListViewControllerDelegate?
    
    // MARK: - Initialization
    init(model: [Season]) {
        self.model = model
        super.init(style: .plain)
        title = SEASONS_LISTVC_TITLE
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectLastSelectedRowFromUserDefaults(in: self, withKey: SEASON_KEY)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "SeasonCell"
        
        // Reutilizamos una celda o, de no haberla, la creamos
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .default, reuseIdentifier: cellId)

        // Obtener los datos del modelo a mostrar en dicha celda
        let season = model[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = "\(season.name) - \(season.numberOfEpisodes)/\(season.totalNumberOfEpisodes)"

        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let season = model[indexPath.row]
        
        // Comunicate change to delegate
        delegate?.seasonListViewController(self, didSelect: season)
        
        // Add notification
        let notificationCenter = NotificationCenter.default
        
        let notification = Notification(name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME),
                                        object: self,
                                        userInfo: [SEASON_KEY: season])
        notificationCenter.post(notification)
//        let seasonDetailVC = SeasonDetailViewController(model: season)
//        navigationController?.pushViewController(seasonDetailVC, animated: true)

        saveLastSelected(at: indexPath.row, forKey: LAST_SEASON)
    }
}

extension SeasonListViewController {    
    func lastRowSelected() -> Season {
        // Extraer la row del User Defaults
        let row = UserDefaults.standard.integer(forKey: LAST_SEASON)
        
        // Averiguar la casa de ese row
        return model[row]
    }

}

