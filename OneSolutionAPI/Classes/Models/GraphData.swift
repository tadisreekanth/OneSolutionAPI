//
//  GraphData.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 14/07/23.
//

import Foundation

public struct GraphData: Codable {
    public var fHold: Int?
    public var fOpenCount: Int?
    public var fClosedCount: Int?
    
    public enum CodingKeys: String, CodingKey {
        case fHold, fOpenCount, fClosedCount
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fHold = try container.decodeIfPresent(Int.self, forKey: .fHold)
        self.fOpenCount = try container.decodeIfPresent(Int.self, forKey: .fOpenCount)
        self.fClosedCount = try container.decodeIfPresent(Int.self, forKey: .fClosedCount)
    }
    
    public init(fHold: Int? = 0,
                fOpenCount: Int? = 0,
                fClosedCount: Int? = 0) {
        self.fHold = fHold
        self.fOpenCount = fOpenCount
        self.fClosedCount = fClosedCount
    }
}

public extension GraphData {
    static var staticValues: GraphData {
        GraphData(fHold: 7711, fOpenCount: 159737, fClosedCount: 7711)
    }
    static var staticValues1: GraphData {
        GraphData(fClosedCount: 7711)
    }
    static var staticValues2: GraphData {
        GraphData(fOpenCount: 159737, fClosedCount: 7711)
    }
}
