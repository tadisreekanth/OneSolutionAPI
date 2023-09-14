//
//  User.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 14/07/23.
//

import Foundation

public class UserData {
    
    public static let shared: UserData = UserData()
    
    public var user: UserBean
            
    deinit {
//        print(log: "deinit \(type(of: self))")
    }

    public init() { user = UserBean () }
    
}
