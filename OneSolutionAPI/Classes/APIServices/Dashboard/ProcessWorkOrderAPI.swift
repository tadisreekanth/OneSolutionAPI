//
//  ProcessWorkOrderAPI.swift
//  OneSolutionAPI
//
//  Created by Sreekanth Reddy Tadi on 30/09/23.
//

import Foundation

public struct ProcessWorkOrderAPI: AbstractAPI {
    public static var instance: ProcessWorkOrderAPI { ProcessWorkOrderAPI() }
}

public extension ProcessWorkOrderAPI {
    
    func fetchWorkOrders(with params: [String: Any]?) async -> Result<[WorkOrder], ResultError> {
        var body = params
        body?["userId"] = userId
        
        let endPoint = AbstractAPIEndPoint(path: APIClient.shared?.path?.workOrders ?? "",
                                           method: .POST,
                                           body: body)
        
        switch await self.callAPI(endPoint: endPoint) {
        case .success(let data):
            guard let data = data else {
                return .failure(.unknown)
            }
            if let model = try? data.decode(WorkOrderModel.self).get(), let workOrders = model.workOrders {
                return .success(workOrders)
            } else if let model = try? data.lowerCasedKeysData.decode(GenericModel.self).get() {
                if let errorMessage = model.message {
                    //show alert
                    return .failure(.errorMessage(errorMessage))
                }
                return .failure(.decode)
            }
            return .failure(.unknown)
        case .failure(let error):
            return .failure(error)
        }
    }
}
