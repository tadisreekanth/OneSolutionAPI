//
//  InventoryAPI.swift
//  OneSolutionAPI
//
//  Created by Sreekanth Reddy Tadi on 02/04/24.
//

import Foundation

public struct InventoryAPI: AbstractAPI {
    public static var instance: InventoryAPI { InventoryAPI() }
}

public extension InventoryAPI {
    
    func save(with body: [String: Any]) async -> Result<Bool, ResultError> {
        let endPoint = AbstractAPIEndPoint(path: APIClient.shared?.path?.inventoryAudit.save ?? "",
                                           method: .POST,
                                           body: body)
        switch await self.callAPI(endPoint: endPoint) {
        case .success(let data):
            guard let data = data else {
                return .failure(.unknown)
            }
            switch data.lowerCasedKeysData.decode(GenericModel.self) {
            case .success(let model):
                if model.statusCode == 200 {
                    return .success(true)
                }
                if let errorMessage = model.message {
                    //show alert
                    return .failure(.errorMessage(errorMessage))
                }
            case .failure(let error):
                return .failure(.errorMessage(error.localizedDescription))
            }
            return .failure(.noData)
        case .failure(let error):
            return .failure(.errorMessage(error.localizedDescription))
        }
    }
}
