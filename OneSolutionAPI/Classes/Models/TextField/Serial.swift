//
//  Serial.swift
//  OneSolutionUtility
//
//  Created by Sreekanth Reddy Tadi on 31/08/23.
//

import Foundation

public struct Serial: OneSolutionModel {
    public var uuid = UUID()
    public var id: String?
    public var name: String?
    public var params: [String : QuantumValue]?
    
    public init(dict: [String: QuantumValue]) {
        id = dict["id"]?.stringValue
        name = dict["name"]?.stringValue
        params = dict
    }
}
