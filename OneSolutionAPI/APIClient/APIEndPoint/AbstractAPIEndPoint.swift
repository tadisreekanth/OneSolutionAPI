//
//  File.swift
//  OneSolution
//
//  Created by sreekanth reddy Tadi on 03/10/22.
//  Copyright © 2022 Sreekanth Reddy. All rights reserved.
//

import Foundation

struct AbstractAPIEndPoint: APIEndPoint {  
    var url:    URL?
    var method: RequestMethod
    var header: [String : String]?
    var body:   [String : Any]?
    
    init(url: String,
         method: RequestMethod = .GET,
         header: [String: String]? = nil,
         body: [String: Any]? = nil) {
        
        self.url    = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        self.method = method
        self.header = header ?? [:]
        self.body   = body
        
        self.header?["User-Agent"] = "Mobile_App"
    }
}
