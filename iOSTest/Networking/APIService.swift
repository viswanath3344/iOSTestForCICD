//
//  APIService.swift
//  iOSTest
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 31/10/23.
//

import Foundation

protocol APIService {
    func request<T: Decodable> (urlString: String, responseType: T.Type) async throws -> T
}


class APIClient: APIService {
    func request<T: Decodable> (urlString: String, responseType: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse =  response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            guard 200..<300 ~= httpResponse.statusCode else {
                throw APIError.invalidStatusCode
            }
            
            return try JSONDecoder().decode(T.self, from: data)
            
        }
        catch DecodingError.keyNotFound(let key, let context){
            print("key: \(key) not found in \(context)")
            throw APIError.decodeError
        }
        catch DecodingError.valueNotFound(let key, let context){
            print("key: \(key) not found in \(context)")
            throw APIError.decodeError
        }
        catch {
            print(error)
            throw APIError.unknownError
        }
         
    }
}
