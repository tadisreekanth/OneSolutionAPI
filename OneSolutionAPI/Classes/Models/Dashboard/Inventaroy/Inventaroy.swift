//
//  ScanSerial.swift
//  OneSolutionAPI
//
//  Created by Sreekanth Reddy Tadi on 06/10/23.
//

import Foundation

public struct Inventaroy: Codable {
    public var uuid = UUID()
    public var serial: String?
    public var date: String?
    public var barcodeUnique: String?
    public var witem: String?
    
    public enum CodingKeys: String, CodingKey {
        case serial, date, barcodeUnique, witem
    }
    
    public init(serial: String? = nil, date: String? = nil, barcodeUnique: String? = nil, witem: String? = nil) {
        self.serial = serial
        self.date = date
        self.barcodeUnique = barcodeUnique
        self.witem = witem
    }
    
    public mutating func update(date: String) {
        self.date = date
    }
}
