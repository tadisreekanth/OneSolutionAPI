//
//  QuantumValue.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 13/07/23.
//

import Foundation
import OneSolutionUtility

public enum QuantumValue: Decodable {
    case int(Int), string(String), bool(Bool), double(Double)
}

public extension QuantumValue {
    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        if let bool = try? decoder.singleValueContainer().decode(Bool.self) {
            self = .bool(bool)
            return
        }
        if let double = try? decoder.singleValueContainer().decode(Double.self) {
            self = .double(double)
            return
        }
        throw QuantumError.missingValue
    }
}

public extension QuantumValue {
    var intValue: Int? {
        switch self {
        case .int(let value): return value
        case .string(let value): return value.intValue
        case .bool(let bool): return bool.intValue
        case .double(_): return 0
        }
    }
    var stringValue: String? {
        switch self {
        case .int(let int): return int.stringValue
        case .string(let string): return string
        case .bool(let bool): return bool.stringValue
        case .double(_): return ""
        }
    }
}

//MARK: - QunatumError
public enum QuantumError: Error {
    case missingValue
}
