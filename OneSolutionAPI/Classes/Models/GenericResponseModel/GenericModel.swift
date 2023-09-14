//
//  GenericResponseModel.swift
//  OneSolution
//
//  Created by sreekanth reddy Tadi on 03/10/22.
//  Copyright © 2022 Sreekanth Reddy. All rights reserved.
//

import Foundation

public struct GenericMessageModel: Codable {
    public let status: String?
    public let statusCode: Int?
    public let message: String?
    public let data: String?
    
    public enum CodingKeys: String, CodingKey {
        case status, message, data
        case statusCode = "statuscode"
    }
}

public struct GenericModel: Codable {
    public let message: String?
    public let status: String?
    public let statusCode: Int?
    
    public enum CodingKeys: String, CodingKey {
        case message, status
        case statusCode = "statuscode"
    }
}
