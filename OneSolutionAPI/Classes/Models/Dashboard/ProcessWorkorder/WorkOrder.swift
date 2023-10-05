//
//  WorkOrder.swift
//  OneSolutionAPI
//
//  Created by Sreekanth Reddy Tadi on 30/09/23.
//

import Foundation

public struct WorkOrderModel: Codable {
    public let message: String?
    public let status: String?
    public let statusCode: Int?
    public let totalRecords: Int?
    public let workOrders: [WorkOrder]?
    
    public enum CodingKeys: String, CodingKey {
        case message, status, statusCode
        case totalRecords = "totRecords"
        case workOrders = "Data"
    }
}

public class WorkOrder: Codable, Hashable {
    public let uuid = UUID()
    public var childs: [WorkOrderChild]?
    public var checkListFlag: Bool?
    public var checkListStatus: String?
    public var isCompleted: String?
    public var serialNum: String?
    public var serviceGroup: String?
    public var serviceNum: String?
    public var shipmentDetailId: Int?
    public var storageName: String?
    public var billingPartyId:Int?
    public var epcServiceGroupId:Int?
    public var shipmentBarcodeUniqueSequence:String?
    public var damageWo: Bool?
    public var linkedCheckList: String?

    public var witem: String?
    public var inProgress: Bool?
    public var resources: Bool?
    public var barcodeUnique: String?
    public var containerNumber: Int?
    
    private var actualTime: String?
    private var tpaTime: String?
    private var paidTime: String?
    private var actualTimeColor: String?
    
    public lazy var workOrderTime: WorkOrderTime? = {
        if let jsonData = try? JSONEncoder().encode(self) {
            do {
                // Decode the JSON data back into an instance of the struct
                return try? JSONDecoder().decode(WorkOrderTime.self, from: jsonData)
            }
        }
        return nil
    }()
    public var linkedCheckLists: [LinkedCheckList]?

    
    public enum CodingKeys: String, CodingKey {
        case childs, checkListFlag, checkListStatus, isCompleted, serialNum, serviceGroup, serviceNum, shipmentDetailId, storageName, billingPartyId, epcServiceGroupId, shipmentBarcodeUniqueSequence, damageWo
        case linkedCheckLists = "linkedCheckListArray"
        case actualTime = "headerActualTime"
        case tpaTime = "headerTpaTime"
        case paidTime = "paidTime"
        case actualTimeColor = "headerTimeColor"
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    public static func == (lhs: WorkOrder, rhs: WorkOrder) -> Bool {
        lhs.uuid == rhs.uuid
    }
}


public class WorkOrderChild: Codable {
    
    public let uuid = UUID()
    public var teamName: String?
    public var amount: String?
    public var carrier: String?
    public var complete: Bool?
    public var customer: String?
    public var descriptionWOChild: String?
    public var dealerName: String?
    public var epcJobRequestCargoServiceDetailId: Int?
    public var expectedDate: String?
    public var hold: Bool?
    public var holdReason: String?
    public var make: String?
    public var model: String?
    public var mountLocation: String?
    public var mountModel: String?
    public var mountSerialNo: String?
    public var mountModelDescription: String?
    public var msoid: String?
    public var quantity: QuantumValue?
    public var rate: QuantumValue?
    public var rateHint: String?
    public var release: Bool?
    public var serialNum: String?
    public var serviceBay: String?
    public var serviceGroup: String?
    public var serviceNum: String?
    public var serviceStatus: String?
    public var startDate: String?
    public var stopDate: String?
    public var woStatus: String?
    public var workShop: String?
    public var zeroRate: String?
    public var signature: Bool?
    public var partSerialNumber: String?
    public var partMso: String?
    public var partWItem: String?
    
    public var selected: Bool?
//    var status: StartStop = .undefined
    public var startTimerId: QuantumValue?
    public var storageName: String?
    
    public var instructions: String?
    public var putBackSerialNumber: String?
    public var containerNumber: String?
    public var containerType: String?
    public var showAddContaierUnit: Bool?
    public var showContainerFields: Bool?
    public var putBackBrecodeUniqueRef: String?
    public var resources: Bool?

    private var actualTime: String?
    private var tpaTime: String?
    private var paidTime: String?
    private var actualTimeColor: String?

    public lazy var workOrderTime: WorkOrderTime? = {
        if let jsonData = try? JSONEncoder().encode(self) {
            do {
                // Decode the JSON data back into an instance of the struct
                return try? JSONDecoder().decode(WorkOrderTime.self, from: jsonData)
            }
        }
        return nil
    }()
//    var workOrderImageList = [OS_WO_Images]()
    
    public enum CodingKeys: String, CodingKey {
        case amount, carrier, complete, customer, dealerName, epcJobRequestCargoServiceDetailId, expectedDate, hold, holdReason, make, model, mountLocation, mountModel, mountSerialNo, mountModelDescription, msoid, quantity, rate, rateHint, release, serialNum, serviceBay, serviceGroup, serviceNum, serviceStatus, startDate, stopDate, woStatus, workShop, zeroRate, signature, partSerialNumber, partMso, partWItem
        case teamName = "TeamName"
        case descriptionWOChild = "description"
//        "workOrderImageList"
//        case workOrderTime
        case actualTime, tpaTime, paidTime, actualTimeColor
    }
}

//
//class WorkOrderMount: NSObject {
//
//
//    var serialNumber: String?
//    var shipmentDetailId: String?
//    var witem: String?
//    var modelCode: String?
//    var description_Mount: String?
//    var customerCode: String?
//    var siteGroup: String?
//    var status: String?
//    var customer: String?
//    var receiveDate: String?
//    var selected: Bool = false
//    override init() {
//        super.init()
//    }
//    init(dict: NSDictionary) {
//        super.init()
//
//        serialNumber = String.checkingNull (dict.value(forKey: "serialNumber") as Any)
//        shipmentDetailId =  String.checkingNull (dict.value(forKey: "shipmentDetailId") as Any)
//        witem =  String.checkingNull (dict.value(forKey: "witem") as Any)
//
//        modelCode = String.checkingNull (dict.value(forKey: "modelCode") as Any)
//        description_Mount =  String.checkingNull (dict.value(forKey: "description") as Any)
//        customerCode =  String.checkingNull (dict.value(forKey: "customerCode") as Any)
//        siteGroup = String.checkingNull (dict.value(forKey: "siteGroup") as Any)
//        status =  String.checkingNull (dict.value(forKey: "status") as Any)
//        customer =  String.checkingNull (dict.value(forKey: "customer") as Any)
//        receiveDate = String.checkingNull(dict.value(forKey: "receiveDate") as Any)
//
//    }
//}
//class GeneralWorkOrder: WorkOrder {
//
//    var containerShipmentUnits = [GeneralWorkOrderContainerUnit]()
//    var epcServiceProcessingIdList = [String]()
//    var epcCheckListDetailId: NSNumber?
//    var forDropDownUnits = [ForDropDownUnits]()
//    override init() {
//        super.init()
//    }
//    override init(dict: NSDictionary) {
//        super.init(dict: dict)
//        epcCheckListDetailId = dict.value(forKey: "epcCheckListDetailId") as? NSNumber
//        if let data = dict.value(forKey: "epcServiceProcessingIdList") as? [Any] {
//            for item in data {
//                if String.checkingNull(item).count > 0 {
//                    self.epcServiceProcessingIdList.append(String.checkingNull(item))
//                }
//            }
//        }
//        if let units = dict.value(forKey: "containerShipmentUnits") as? [NSDictionary] {
//            for unit in units {
//                self.containerShipmentUnits.append(GeneralWorkOrderContainerUnit(dict: unit))
//            }
//        }
//        if let units = dict.value(forKey: "forDropDownUnits") as? [NSDictionary] {
//            for unit in units {
//                self.forDropDownUnits.append(ForDropDownUnits(dict: unit))
//            }
//        }
//    }
//}
//
//class GeneralWorkOrderContainerUnit: NSObject {
//
//    var barcodeUniqueSeq: String?
//    var cargoId: String?
//    var customer: String?
//    var model: String?
//    var porLocation: String?
//    var shipmentDetailId: String?
//    var wItem: String?
//    var wheelQuantity:NSNumber?
//
//    override init() {
//        super.init()
//    }
//    init(dict: NSDictionary) {
//        super.init()
//        barcodeUniqueSeq = String.checkingNull(dict.value(forKey: "barcodeUniqueSeq") as Any)
//        cargoId = String.checkingNull(dict.value(forKey: "cargoId") as Any)
//        customer = String.checkingNull(dict.value(forKey: "customer") as Any)
//        model = String.checkingNull(dict.value(forKey: "model") as Any)
//        porLocation = String.checkingNull(dict.value(forKey: "porLocation") as Any)
//        shipmentDetailId = String.checkingNull(dict.value(forKey: "shipmentDetailId") as Any)
//        wItem = String.checkingNull(dict.value(forKey: "wItem") as Any)
//        wheelQuantity = (dict.value(forKey: "wheelQuantity") as? NSNumber)
//    }
//
//}
//
//class ForDropDownUnits: NSObject{
//
//    var barcodeUniqueSeq: String?
//    var cargoId: String?
//    var shipmentDetailId: String?
//    var wItem: String?
//    override init() {
//        super.init()
//    }
//    init(dict: NSDictionary) {
//        super.init()
//        barcodeUniqueSeq = String.checkingNull(dict.value(forKey: "barcodeUniqueSeq") as Any)
//        cargoId = String.checkingNull(dict.value(forKey: "cargoId") as Any)
//        shipmentDetailId = String.checkingNull(dict.value(forKey: "shipmentDetailId") as Any)
//        wItem = String.checkingNull(dict.value(forKey: "wItem") as Any)
//
//    }
//
//}

//MARK: - LinkedCheckList
public class LinkedCheckList: Codable {

    public var linkedEpcCheckListDetailId: String?
    public var linkedCheckList: String?
    public var selectedLinkedCheckList: Bool = false
    public var linkedServiceRequestNumber: String?
    public var originalServiceRequestNumber:String?

    public enum CodingKeys: String, CodingKey {
        case linkedEpcCheckListDetailId, linkedCheckList, selectedLinkedCheckList, linkedServiceRequestNumber, originalServiceRequestNumber
    }
}


//MARK: - WorkOrderTime
public class WorkOrderTime: Codable {
    public var actualTime: String?
    public var tpaTime: String?
    public var paidTime: String?
    private var actualTimeColor: String?
    
    public enum CodingKeys: String, CodingKey {
        case actualTime, tpaTime, paidTime, actualTimeColor
    }
    
    public enum CodingKeysHeader: String, CodingKey {
        case actualTime = "headerActualTime"
        case tpaTime = "headerTpaTime"
        case paidTime = "paidTime"
        case actualTimeColor = "headerTimeColor"
    }
    
    required public init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            actualTime = try container.decode(String.self, forKey: .actualTime)
            tpaTime = try container.decode(String.self, forKey: .tpaTime)
            paidTime = try container.decode(String.self, forKey: .paidTime)
            actualTimeColor = try container.decode(String.self, forKey: .actualTimeColor)
        } else if let container = try? decoder.container(keyedBy: CodingKeysHeader.self) {
            actualTime = try container.decode(String.self, forKey: .actualTime)
            tpaTime = try container.decode(String.self, forKey: .tpaTime)
            paidTime = try container.decode(String.self, forKey: .paidTime)
            actualTimeColor = try container.decode(String.self, forKey: .actualTimeColor)
        }
    }
    
    public var timeColor: UIColor {
        switch actualTimeColor?.lowercased() {
        case "red" : return .red
        case "green": return .green
        default: return .black
        }
    }
}
