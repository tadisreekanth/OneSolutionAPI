//
//  APIPath.swift
//  OneSolutionAPI
//
//  Created by Sreekanth Reddy Tadi on 30/09/23.
//

import Foundation

public protocol APIPath: AnyObject {
    var login: String { get }
    
    //Home
    var graphData: String { get }
    
    //Process Work order
    var workOrders: String { get }
}
