//
//  APIEndpoints.swift
//  iOSTest
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 31/10/23.
//

import Foundation


let BASE_URL = "https://earthquake.usgs.gov"

enum APIEndpoints: String {
    private var baseURL: String {
        return BASE_URL
    }
    
    case earthquakes = "/earthquakes/feed/v1.0/summary/4.5_week.geojson"
    
    var urlString: String {
        baseURL + rawValue
    }
}
