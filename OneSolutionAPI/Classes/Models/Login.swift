//
//  Login.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 30/06/23.
//

import Foundation

public struct Login: Codable {
    public let userId: Int?
    public let shortName: String?
    public let companyId: Int?
    public let companyName: String?
    public let designation: String?
    public let enableAustraliaAnnotation: Bool?
    public let enableAustraliaFieldsInMobile: Bool?
    public let epcCompanyuserDetails: [CompanyDetails]?
    public let isExternalUser: Bool?
    public let roles: [String]?
    public let status: String?
    public let statusCode: Int?
    
    public enum CodingKeys: String, CodingKey {
        case userId
        case shortName
        case companyId
        case companyName
        case designation
        case enableAustraliaAnnotation
        case enableAustraliaFieldsInMobile
        case epcCompanyuserDetails = "epcCompanyuserDetailPojoResp"
        case isExternalUser = "mobileExternalUser"
        case roles
        case status
        case statusCode
    }
}


public struct CompanyDetails: Codable {
    public let companyName: String?
    public let companyDetailId: Int?

    public enum CodingKeys: String, CodingKey {
        case companyName
        case companyDetailId = "userCompanyDetailId"
    }
}
