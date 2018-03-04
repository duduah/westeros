//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 28/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var seasonNameLabel: UILabel!
    @IBOutlet weak var seasonReleaseDateLabel: UILabel!
    @IBOutlet weak var seasonTotalNumberOfEpisodesLabel: UILabel!
    @IBOutlet weak var seasonPlotLabel: UILabel!
    
    // MARK: - Actions
    @IBAction func episodesListButton(_ sender: UIButton) {
        let episodes = model.sortedEpisodes
        if (episodes.count > 0) {
            let episodeListVC = EpisodeListViewController(model: episodes, title: .episodesTitle)
            navigationController?.pushViewController(episodeListVC, animated: true)
        }
    }
    
    // MARK: - Properties
    var model: Season
    
    // MARK: - Initialization
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        
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
    
    // MARK: - Sync
    func syncModelWithView() {
        seasonReleaseDateLabel.text = model.releaseDate.description
        seasonTotalNumberOfEpisodesLabel.text = model.totalNumberOfEpisodes.description
        seasonPlotLabel.text = model.plot
        title = model.name
    }
    
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ vc: SeasonListViewController, didSelect season: Season) {
        self.model = season
        syncModelWithView()
        self.reloadInputViews()
    }
}

