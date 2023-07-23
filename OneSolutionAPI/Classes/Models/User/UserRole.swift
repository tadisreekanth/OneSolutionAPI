//
//  UserRole.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 14/07/23.
//

import Foundation
import OneSolutionUtility

var M_TEAM_LEAD_SIGN_OFF = false
var M_PROCESS_WO_ADD_SERVICE = false

class UserRole {
    
    var navigated = false
    var role: Role?
    var displayName: String?
    
//    var storyBoard: Storyboard?
    var vcIdentifier: String?
    
    
    deinit {
        print(log: "deinit \(type(of: self))")
    }
    
    init() { }
    
    init(role: String) {
        self.role = Role(rawValue: role)
        moduleName ()
    }
    
    
    func moduleName () {
        if let name = role {
            switch name {
            case .serial_details:
                displayName = "  Serial # Details"
//                storyBoard = .Dashboard
                vcIdentifier = "SerialDetailsVC"
            case .process_workorder:
//                storyBoard = .Checklist
                displayName = "  Process WorkOrder"
            case .general_checklist:
//                storyBoard = .GeneralChecklist
                displayName = "  General CheckList"
            case .por_location:
                displayName = "  POR Location"
//                storyBoard = .Dashboard
                vcIdentifier = "PORLocationGeneralVC"
            case .load_out:
                displayName = "  Load out"
//                storyBoard = .Loadout
                vcIdentifier = "LoadOutVC"
                //                vcIdentifier = "LoadOutTemplatesVC"
            case .receive_witem:
                displayName = "  Receive Witem"
//                storyBoard = .Dashboard
                vcIdentifier = "ReceiveWitemVC"
            case .load_witem:
                displayName = "  Load Witem"
                displayName = "  Load With / Mount"
//                storyBoard = .Loadout
                vcIdentifier = "LoadMountVC"
            case .loadout_checklist:
                displayName = "  Load out Checklist"
//                storyBoard = .Loadout
                vcIdentifier = "LoadOutTemplatesVC"
            case .loadout_bol_checklist:
                displayName = "  Load out Checklist - BOL"
//                storyBoard = .Loadout
                vcIdentifier = "LoadOutTemplatesVC_Re"
            case .inventory_audit:
                displayName = "  Inventory Audit"
//                storyBoard = .Dashboard
                vcIdentifier = "InventoryAuditVC"
            case .general_service_workorder:
                displayName = "  General Service WorkOrder"
//                storyBoard = .GeneralProcessWorkOrder
                vcIdentifier = "GeneralProcessWorkOrdersVC"
            case .team_lead_sign_off:
                M_TEAM_LEAD_SIGN_OFF = true
            case .process_workorder_add_service:
                M_PROCESS_WO_ADD_SERVICE = true
            }
        }
    }
}

enum Role: String {
    case serial_details                 = "M_SERIAL_DETAILS"
    case process_workorder              = "M_PROCESS_WORK_ORDER_NEW"
    case general_checklist              = "M_GENERAL_CHK_LIST"
    case por_location                   = "M_POR_LOCALTION"
    case load_out                       = "M_LOAD_OUT"
    case receive_witem                  = "M_RECEIVE_WITEM"
    case load_witem                     = "M_LOAD_WITEM"
    case loadout_checklist              = "M_LOAD_OUT_CHECK_LIST"
    case loadout_bol_checklist          = "M_LOAD_OUT_BOL_CHECK_LIST"
    case inventory_audit                = "M_INVENTORY_AUDIT"
    case general_service_workorder      = "M_GENERAL_SERVICE_WO"
    case team_lead_sign_off             = "M_TEAM_LEAD_SIGN_OFF"
    case process_workorder_add_service  = "M_PROCESS_WO_ADD_SERVICE"
}
