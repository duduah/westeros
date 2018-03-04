//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 28/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    @IBOutlet weak var episodeReleaseDateLabel: UILabel!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeDirectorLabel: UILabel!
    @IBOutlet weak var episodeWriterLabel: UILabel!
    @IBOutlet weak var episodePlotLabel: UILabel!
    
    // MARK: - Properties
    var model: Episode
    
    // MARK: - Initialization
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        
        title = model.title
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
        subscriteToDefaultNotification(self,
                                       selector: #selector(seasonDidChange),
                                       name: SEASON_DID_CHANGE_NOTIFICATION_NAME)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromDefaultNotification(self)
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        episodeTitleLabel.text = model.title
        episodeReleaseDateLabel.text = model.releaseDate.description
        episodePlotLabel.text = model.plot
        episodeWriterLabel.text = model.scriptWriter.joined(separator: " & ")
        episodeDirectorLabel.text = model.director.joined(separator: " & ")
        
        title = model.title
    }
    
    // MARK: - Notifications
    @objc func seasonDidChange(notification: Notification) {
        guard let info = notification.userInfo else {
            return
        }
        let season = info[NotificationKeys.season.rawValue] as? Season
        model = (season?.sortedEpisodes.first)!
        syncModelWithView()
    }
}

