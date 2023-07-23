//
//  File.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 13/07/23.
//

import Foundation

public protocol OneSolutionModel: Decodable {
    var uuid: UUID { get set }
    var id: String? { get set }
    var name: String? { get set }
    var params: [String: QuantumValue]? { get set }
    
    init(dict: [String: QuantumValue])
}
