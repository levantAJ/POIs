//
//  AppDelegate.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        GMSServices.provideAPIKey("AIzaSyBunLcImqEqKl2565-Sip8v7n_clC1GHF0")
    }
}

