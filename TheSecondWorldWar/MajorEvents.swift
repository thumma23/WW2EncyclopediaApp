//
//  MajorEvents.swift
//  TheSecondWorldWar
//
//  Created by Sahith Thumma on 7/1/21.
//

import Foundation

class MajorEvents: ObservableObject{
    var events = Events()
    var majorevents : [Event]
    
    init() {
        majorevents = []
        getMajorEvents()
    }
    
    func getMajorEvents(){
        for e in events.events{
            if(e.MajorEvent){
                majorevents.append(e)
            }
        }
    }
}
