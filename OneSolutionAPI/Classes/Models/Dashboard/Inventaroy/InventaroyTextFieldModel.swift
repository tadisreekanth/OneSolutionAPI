//
//  InventaroySiteGroup.swift
//  OneSolutionAPI
//
//  Created by Sreekanth Reddy Tadi on 02/04/24.
//

import Foundation

public struct InventaroySiteGroup: OneSolutionModel {
    public var uuid: UUID = UUID()
    public var id: String?
    public var name: String?
    public var params: [String : QuantumValue]?
    
    public init(dict: [String : QuantumValue]) {
        id = dict["siteGroupId"]?.stringValue ?? ""
        name = dict["description"]?.stringValue ?? ""
        params = dict
    }
}
