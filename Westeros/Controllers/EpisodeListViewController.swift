//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 28/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
    
    // MARK: - Properties
    let model: [Episode]
    
    // MARK: - Initialization
    init(model: [Episode], seasonTitle: String) {
        self.model = model
        super.init(style: .plain)
        
        title = seasonTitle
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
        return model.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "EpisodeCell"
        
        // Reuse a cell or create a new one
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Get the model item for that cell
        let episode = model[indexPath.row]
        
        // Show a text from the model
        cell.textLabel?.text = episode.title
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let episodeDetailVC = EpisodeDetailViewController(model: episode)
        
        navigationController?.pushViewController(episodeDetailVC, animated: true)
    }
}
