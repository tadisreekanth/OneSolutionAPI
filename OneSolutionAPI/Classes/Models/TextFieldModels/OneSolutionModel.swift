//
//  File.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 13/07/23.
//

import Foundation
import OneSolutionUtility

public protocol OneSolutionModel: Decodable {
    var uuid: UUID { get set }
    var id: String? { get set }
    var name: String? { get set }
    var params: [String: QuantumValue]? { get set }
    
    init(dict: [String: QuantumValue])
}

public extension OneSolutionModel {
    var displayName: String {
        if let name = self.name {
            return name
        }
        return self.params?.compactMap({ $0.value.stringValue }).joinedLine ?? ""
    }
}
