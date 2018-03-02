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
    
    // MARK: - Properties
    let model: Episode
    
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
    
    // MARK: - Sync
    func syncModelWithView() {
        episodeReleaseDateLabel.text = model.releaseDate.description
        title = model.title
    }
}
