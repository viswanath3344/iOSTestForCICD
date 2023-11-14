//
//  APIError.swift
//  iOSTest
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 31/10/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidStatusCode
    case unknownError
    case decodeError
    
    var message: String {
        switch self {
        case .invalidURL : return "Invalid url provided"
        case .invalidResponse: return "Invalid response received"
        case .decodeError : return "JSON decode error"
        case .invalidStatusCode: return "Invalid status code"
        case .unknownError: return "Unknown Error"
        }
    }
}
