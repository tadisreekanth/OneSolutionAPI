//
//  ServiceURL.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 02/07/23.
//

import Foundation

public protocol APIRoute: AnyObject {
    var host: String { get }
    var endPoint: String { get }
    var value: String { get }
    
    func hostUpdated()
}

public extension APIRoute {
    var value: String {
        return host + endPoint
    }
}


public protocol APIPath: AnyObject {
    var login: String { get }
    var graphData: String { get }
}
