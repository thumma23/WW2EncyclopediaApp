//
//  Event.swift
//  TheSecondWorldWar
//
//  Created by Sahith Thumma on 6/29/21.
//

import Foundation

struct Event : Decodable, Identifiable, Hashable{
    let id: Int
    let lat, long: Double
    let EventName, Location, Date: String
    let MajorEvent : Bool
    let Description : [[String]]
}
