//
//  TheSecondWorldWarApp.swift
//  TheSecondWorldWar
//
//  Created by Sahith Thumma on 6/28/21.
//

import SwiftUI

@main
struct TheSecondWorldWarApp: App {
    @StateObject var events = Events()
    init(){
        UITabBar.appearance().barTintColor = UIColor.black
    }
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationView{
                    EventView()
                }
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Explore")
                }
                NavigationView{
                    MapView()
                }
                .tabItem{
                    Image(systemName: "globe")
                    Text("Map")
                }
                NavigationView{
                    SearchView()
                }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            }
            .environmentObject(events)
        }
    }
}

