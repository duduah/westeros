//
//  UIViewController+Additions.swift
//  Westeros
//
//  Created by Diego Gay Saez on 13/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

extension UIViewController {
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}

extension UISplitViewController: UITabBarControllerDelegate {
//extension UITabBarController: UITabBarControllerDelegate {

    public func tabBarController(_ tabBarController: UITabBarController,
                                 didSelect viewController: UIViewController) {
        
        // Creamos los controladores
        let (_, houseDetailVC, _, seasonDetailVC) = Repository.local.appModels()
        let detailViewControllers = [houseDetailVC,
                                   seasonDetailVC]

        let detailVC = viewController.childViewControllers.first
        if detailVC is SeasonListViewController {
            (detailVC as! SeasonListViewController).delegate = detailViewControllers[tabBarController.selectedIndex] as! SeasonListViewControllerDelegate
        } else if detailVC is HouseListViewController {
            (detailVC as! HouseListViewController).delegate = detailViewControllers[tabBarController.selectedIndex] as! HouseListViewControllerDelegate
        }
        
        self.showDetailViewController(detailViewControllers[tabBarController.selectedIndex].wrappedInNavigation(),
                                      sender: viewController)
    }
}

