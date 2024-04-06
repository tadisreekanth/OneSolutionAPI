//
//  File.swift
//  OneSolutionAPI
//
//  Created by Sreekanth Reddy Tadi on 20/03/24.
//

import Foundation

public struct PORLocationSerial: OneSolutionModel {
    public var uuid: UUID = UUID()
    public var id: String?
    public var name: String?
    public var params: [String : QuantumValue]?
    
    public init(dict: [String : QuantumValue]) {
        id = ""
        name = dict["searchName"]?.stringValue ?? ""
        params = dict
    }
}


public struct PORLocationLOT: OneSolutionModel {
    public var uuid: UUID = UUID()
    public var id: String?
    public var name: String?
    public var params: [String : QuantumValue]?
    
    public init(dict: [String : QuantumValue]) {
        id = dict["siteId"]?.stringValue ?? ""
        name = dict["siteName"]?.stringValue ?? ""
        params = dict
    }
}

//{\"CompanyId\":1,\"siteId\":\"CLAY\",\"siteName\":\"CLAYTON\",\"company\":\"KEEN LOGISTICS LTD\",\"siteGroup\":\"CLAYTON\"},
    
public struct PORLocationArea: OneSolutionModel {
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

public struct PORLocationRow: OneSolutionModel {
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

public struct PORLocationSpace: OneSolutionModel {
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
