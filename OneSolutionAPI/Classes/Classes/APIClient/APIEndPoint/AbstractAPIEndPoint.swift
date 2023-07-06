//
//  File.swift
//  OneSolution
//
//  Created by sreekanth reddy Tadi on 03/10/22.
//  Copyright © 2022 Sreekanth Reddy. All rights reserved.
//

import Foundation

struct AbstractAPIEndPoint: APIEndPoint {  
    var path    :   String?
    var method  :   RequestMethod
    var header  :   [String : String]?
    var body    :   [String : Any]?
    
    init(path: String,
         method: RequestMethod = .GET,
         header: [String: String]? = nil,
         body: [String: Any]? = nil) {
        
        self.path   = path
        self.method = method
        self.header = header ?? [:]
        self.body   = body
        
        self.header?["User-Agent"] = "Mobile_App"
    }
}
