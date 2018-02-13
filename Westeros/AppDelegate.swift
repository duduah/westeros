//
//  AppDelegate.swift
//  Westeros
//
//  Created by Diego Gay Saez on 08/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//      Podemos poner esto y quitar los interrogantes del optional de window:
//        guard let window = window else {
//            return true;
//        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .cyan // Realmente es UIColor.cyan, pero por inferencia de tipos ya lo sabe y no hace falta poner el tipo UIColor
        
        // Al no usar storyboard, hay que hacerla visible:
        window?.makeKeyAndVisible()
        
        // Crear modelos
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Huargo Wolf")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
        
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Lion")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido!")
        
        // Crear controladores
        let starkHouseViewController = HouseDetailViewController(model: starkHouse)
        let lannisterHouseViewController = HouseDetailViewController(model: lannisterHouse)
        
        // Creamos los navigations
        let starkNavigationController = UINavigationController(rootViewController:
            starkHouseViewController)
        let lannisterNavigationController = UINavigationController(rootViewController:
            lannisterHouseViewController)

        // Crear combinadores
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [
            starkNavigationController, lannisterNavigationController
        ]

        // Asignamos al rooViewController
        window?.rootViewController = tabBarViewController
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

