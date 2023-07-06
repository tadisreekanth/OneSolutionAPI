//
//  Login.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 30/06/23.
//

import Foundation

struct Login: Codable {
    
    let userId: Int?
    let shortName: String?
    let companyId: Int?
    let companyName: String?
    let designation: String?
    let enableAustraliaAnnotation: Bool?
    let enableAustraliaFieldsInMobile: Bool?
    let epcCompanyuserDetails: [CompanyDetails]?
    let isExternalUser: Bool?
    let roles: [String]?
    let status: String?
    let statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
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


struct CompanyDetails: Codable {
    let companyName: String?
    let companyDetailId: Int?

    enum CodingKeys: String, CodingKey {
        case companyName
        case companyDetailId = "userCompanyDetailId"
    }
}
