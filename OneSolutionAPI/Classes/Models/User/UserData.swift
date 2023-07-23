//
//  User.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 14/07/23.
//

import Foundation

class UserData {
    
    static let shared: UserData = UserData()
    
    var user: UserBean
            
    deinit {
        print(log: "deinit \(type(of: self))")
    }

    init() { user = UserBean () }
    
}
