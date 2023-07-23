//
//  GraphData.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 14/07/23.
//

import Foundation

struct GraphData: Codable {
    var fHold: Int?
    var fOpenCount: Int?
    var fClosedCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case fHold, fOpenCount, fClosedCount
    }
}
