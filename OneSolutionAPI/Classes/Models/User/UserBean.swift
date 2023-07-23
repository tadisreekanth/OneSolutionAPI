//
//  UserBean.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 14/07/23.
//

import Foundation
import OneSolutionUtility

class UserBean: ObservableObject {
    
    @Published var userID: Int?
    var userDetails = UserDetails ()
    
    init() { }
    
    func update(with login: Login) {
        userID = login.userId
        userDetails.update(with: login)
    }
    
    func remove() {
        userDetails = UserDetails()
        userID = nil
    }
}


class UserDetails {
    
    var companyId: Int?
    var companyName: String?
    var designation: String?
    var enableManualSerialSearch: Bool?
    var enableAustraliaAnnotation: Bool?
    var enableAustraliaFieldsInMobile: Bool?
    var isExternalUser:Bool?
    
    var companyDetails = [CompanyDetails] ()
    var userRoles = [UserRole] ()
    
    init() { }
    
    func update(with login: Login) {
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
