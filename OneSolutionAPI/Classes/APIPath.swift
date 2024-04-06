//
//  APIPath.swift
//  OneSolutionAPI
//
//  Created by Sreekanth Reddy Tadi on 30/09/23.
//

import Foundation

public protocol APIPath: AnyObject {
    var login: String { get }
    
    var dashboard: DashboardPath { get }
    
    var processWorkOder: ProcessWorkOrderPath { get }
    
    var inventoryAudit: InventoryAuditPath { get }
    
    var generalPORLocation: GeneralPORLocationPath { get }
}

public protocol DashboardPath {
    var graphData: String { get }
}

public protocol ProcessWorkOrderPath {
    var workOrders: String { get }
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
