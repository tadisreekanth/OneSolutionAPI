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
    
    var inventoryAudit: InventoryAuditPath { get }
    
    var generalPORLocation: GeneralPORLocationPath { get }
}

public protocol InventoryAuditPath {
    
    var siteGroup: String { get }
    
    var save: String { get }
}

public protocol GeneralPORLocationPath {
    
    var serialDetails: String { get }
    var previousVinDetails: String { get }
    
    var serial: String { get }
    var lot: String { get }
    var area: String { get }
    var row: String { get }
    var column: String { get }
     
    var update: String { get }
}
