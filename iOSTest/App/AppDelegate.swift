//
//  AppDelegate.swift
//  iOSTest
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 10/11/23.
//

import Foundation
import UIKit

import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterDistribute

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
          AppCenter.logLevel = .verbose
        
          AppCenter.start(withAppSecret: "53a2ed40-a067-493a-af26-11bbccdb6cdb", services:[
            Crashes.self, Analytics.self, Distribute.self])
        
        Crashes.notify(with: .always)
       // 69db1381ce8ef9a4932545ffeaed64a47952ee6f
       // "53a2ed40-a067-493a-af26-11bbccdb6cdb"
        return true
    }
}
