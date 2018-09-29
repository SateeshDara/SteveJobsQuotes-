//
//  AppDelegate.swift
//  SteveJobs
//
//  Created by Sateesh Dara on 20/09/18.
//  Copyright © 2018 Sateesh Dara. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = PageController(collectionViewLayout: UICollectionViewFlowLayout())
        return true
    }
        
}
