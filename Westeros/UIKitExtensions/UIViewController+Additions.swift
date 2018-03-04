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
    public func tabBarController(_ tabBarController: UITabBarController,
                                 didSelect viewController: UIViewController) {
        
        // Obtenemos los últimos Details seleccionados de Houses y Seasons
        let (_, houseDetailVC, _, seasonDetailVC) = Repository.local.appModels()
        let detailViewControllers = [houseDetailVC,
                                   seasonDetailVC]

        // Detectamos el tipo de controlador que contiene el tab pulsado para asignarle el
        // delegado correspondiente.
        let detailVC = viewController.childViewControllers.first
        if detailVC is SeasonListViewController {
            (detailVC as! SeasonListViewController).delegate = detailViewControllers[tabBarController.selectedIndex] as? SeasonListViewControllerDelegate
        } else if detailVC is HouseListViewController {
            (detailVC as! HouseListViewController).delegate = detailViewControllers[tabBarController.selectedIndex] as? HouseListViewControllerDelegate
        }
        
        // Mostramos el detalle del controlador seleccionado en el tab.
        self.showDetailViewController(detailViewControllers[tabBarController.selectedIndex].wrappedInNavigation(),
                                      sender: viewController)
    }
}

