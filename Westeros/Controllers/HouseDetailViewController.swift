//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 12/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var wordsLabel: UILabel!
    
    // MARK: - Properties
    let model: House
    
    // Mark: - Initialization
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        
        // Título que se verá en el tab
        title = model.name
    }
    
    // Chapuza de los de Cupertino relacionada con los nil
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        // Model -> View
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
    }

    // MARK: - UI
    func setupUI() {
        let wikiButton = UIBarButtonItem(title: "Wiki",
                                         style: .plain,
                                         target: self,
                                         action: #selector(displayWiki))
        let membersButton = UIBarButtonItem(title: "Member",
                                            style: .plain,
                                            target: self,
                                            action: #selector(displayMembers))
        navigationItem.rightBarButtonItems = [wikiButton, membersButton]
    }
    
    @objc func displayWiki() {
        // Creamos el WikiVC
        let wikiViewController = WikiViewController(model: model)
        
        // Hacemos push
        navigationController?.pushViewController(wikiViewController, animated: true)
    }
    
    @objc func displayMembers() {
        // Creamos el memberVC
        let arrayModel = model.sortedMembers
        let membersVC = MemberList2ViewController(model: arrayModel)
        
        // Hacemos push
        if arrayModel.count > 0 {
            navigationController?.pushViewController(membersVC, animated: true)
        }
    }
}
