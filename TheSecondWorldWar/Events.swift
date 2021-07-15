//
//  Events.swift
//  TheSecondWorldWar
//
//  Created by Sahith Thumma on 6/29/21.
//

import Foundation

class Events: ObservableObject {
    var events : [Event]
    
    init() {
        let url = Bundle.main.url(forResource: "WW2Events", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        events = try! JSONDecoder().decode([Event].self, from: data)
    }
    
}
