//
//  GenericResponseModel.swift
//  OneSolution
//
//  Created by sreekanth reddy Tadi on 03/10/22.
//  Copyright © 2022 Sreekanth Reddy. All rights reserved.
//

import Foundation

struct GenericMessageModel: Codable {
    
    let status: String?
    let statusCode: Int?
    let message: String?
    let data: String?
    
    enum CodingKeys: String, CodingKey {
        case status, message, data
        case statusCode = "statuscode"
    }
    
}

struct GenericModel: Codable {
    let message: String?
    let status: String?
    let statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case message, status
        case statusCode = "statuscode"
    }
}
