//
//  iOSTestApp.swift
//  iOSTest
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 31/10/23.
//

import SwiftUI

@main
struct iOSTestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
