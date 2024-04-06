//
//  UserBean.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 14/07/23.
//

import Foundation
import OneSolutionUtility

public class UserBean: ObservableObject {
    
    @Published public var userID: Int?
    @Published public var userDetails: UserDetails
    
    public init() { 
        userDetails = UserDetails()
    }
    
    public func update(with login: Login) {
        userID = login.userId
        userDetails.update(with: login)
    }
    
    public func remove() {
        userDetails = UserDetails()
        userID = nil
    }
}


public class UserDetails {
    
    public var companyId: Int?
    public var companyName: String?
    public var designation: String?
    public var enableManualSerialSearch: Bool?
    public var enableAustraliaAnnotation: Bool?
    public var enableAustraliaFieldsInMobile: Bool?
    public var isExternalUser:Bool?
    
    public var companyDetails = [CompanyDetails] ()
    public var userRoles = [UserRole] ()
    
    public init() { }
    
    public func update(with login: Login) {
        self.companyId = login.companyId
        self.companyName = login.companyName
        self.designation = login.designation
        //        self.enableManualSerialSearch = login.ena
        self.enableAustraliaAnnotation = login.enableAustraliaAnnotation
        self.enableAustraliaFieldsInMobile = login.enableAustraliaFieldsInMobile
        self.isExternalUser = login.isExternalUser
        
        self.companyDetails = login.epcCompanyuserDetails ?? []
        if let roles = login.roles {
            var roleNames = [String]()
            for role in roles {
                let userrole = UserRole (role: role)
                if let displayName = userrole.displayName {
                    if roleNames.contains(displayName) { }
                    else {
                        userRoles.append(userrole)
                        roleNames.append(displayName)
                        
                        print(log: userrole.role?.rawValue ?? "")
                    }
                }
            }
        }
    }
}
