//
//  ContentView.swift
//  iOSTest
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 31/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentVM = ContentListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if let items = contentVM.items {
                    List(items, id: \.id) { item in
                        HStack {
                            Text(item.place)
                            Spacer()
                            
                            if item.showAlert {
                                Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                            }
                        }
                    }.listStyle(PlainListStyle())
                    
                }else {
                        Text("Loading...")
                    }
                
            }
            .navigationTitle("Earthquakes")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await contentVM.getEarthQuakeData()
            }
        }
    }
    
    func cellView(item: Feature) -> some View {
        HStack {
            Text(item.properties.place)
            Spacer()
            if item.properties.mag > 6.0 {
                Image(systemName: "exclamationmark.brakesignal")
                    .font(.largeTitle).foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

