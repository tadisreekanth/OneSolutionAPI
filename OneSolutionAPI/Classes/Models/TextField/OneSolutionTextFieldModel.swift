//
//  OneSolutionTextFieldModel.swift
//  OneSolutionTextField
//
//  Created by Sreekanth Reddy Tadi on 31/08/23.
//

import Foundation

public struct OneSolutionTextFieldModel: Decodable {
    public let message: String?
    public let status: String?
    public let statusCode: Int?
    public let data: [[String: QuantumValue]]?
    
    public enum CodingKeys: String, CodingKey {
        case message, status, statusCode
        case data = "Data"
    }
    
    public enum CodingKeys2: String, CodingKey {
        case message, status, statusCode
        case data = "Data"
    }
}

public extension OneSolutionTextFieldModel {
    func models( _ type: OneSolutionModel.Type) -> [OneSolutionModel] {
        var models = [OneSolutionModel]()
        if let modelsData = data {
            for model in modelsData {
                models.append(type.init(dict: model))
            }
        }
        return models
    }
}
