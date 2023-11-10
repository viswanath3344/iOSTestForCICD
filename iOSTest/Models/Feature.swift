//
//  Feature.swift
//  iOSTest
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 31/10/23.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let properties: Property
    let id: String
}
