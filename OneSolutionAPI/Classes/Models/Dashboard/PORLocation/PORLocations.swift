//
//  PORLocation.swift
//  OneSolutionAppInterface
//
//  Created by Sreekanth Reddy Tadi on 08/03/24.
//

import Foundation

public struct PORLocations: Codable {
    public let locations: [PORLocationGeneral]?
    public let statusCode: Int?
    public let status: String?
    
    public enum CodingKeys: String, CodingKey {
        case locations = "Data"
        case statusCode, status
    }
}

public struct PORLocationGeneral: Codable {
    public var companyId: String?
    public var company: String?
    
    public var shipmentDetailId: Int?
    public var cargoId: String?
    
    public var siteGroup: String?
    public var siteId: String?
    public var siteName: String?
        
    public var backupStorageLocation: String?
    public var backupStorageDate: String?
    public var backupLOT: String?

    public enum CodingKeys: String, CodingKey {
        case company, cargoId, siteGroup, siteId, siteName, backupStorageLocation, backupStorageDate, backupLOT
        case companyId = "CompanyId"
        case shipmentDetailId = "ShipmentDetailId"
    }
}

public struct PORLocationPreviousDetails: Codable {
    public var siteId, storage, row, column: String?
    public var sitegroupId: QuantumValue
    public let statusCode: Int?
    public let status: String?
    
    public enum CodingKeys: String, CodingKey {
        case siteId, storage, row, column, sitegroupId
        case statusCode, status
    }
}
