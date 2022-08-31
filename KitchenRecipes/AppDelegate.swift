//
//  AppDelegate.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 29/08/22.
//

import Foundation
import UIKit
import GoogleMaps

class AppDelegate: UIResponder, UIApplicationDelegate {
    
     var locationManager = CLLocationManager()
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            GMSServices.provideAPIKey("API_KEY_HERE")
            return true
        }
    
}

