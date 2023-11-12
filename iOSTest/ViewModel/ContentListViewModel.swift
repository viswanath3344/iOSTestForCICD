//
//  ContentViewModel.swift
//  iOSTest
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 31/10/23.
//

import Foundation

struct EarthQuakeViewModel {
    let place: String
    let id: String
    let showAlert: Bool
}

class ContentListViewModel: ObservableObject {
    @Published var items: [EarthQuakeViewModel]?
    
    var apiService: APIService?
    
    init(apiService: APIService = APIClient()) {
        self.apiService = apiService
    }
    
    func getEarthQuakeData() async {
        do {
            let response = try await apiService?.request(urlString: APIEndpoints.earthquakes.urlString, responseType: Response.self)
            
            let viewModels = response?.features.map({ feature in
                return EarthQuakeViewModel(
                     place: feature.properties.place,
                     id: feature.id,
                     showAlert: feature.properties.mag > 5)
             })
            
            await MainActor.run(body: {
                items = viewModels
            })
        }
        catch let error as APIError {
            print(error.message)
        }
        catch {
            print(error)
        }
    }
}
