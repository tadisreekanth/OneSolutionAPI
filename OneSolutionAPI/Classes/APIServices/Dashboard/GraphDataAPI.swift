//
//  GraphDataAPI.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 14/07/23.
//

import Foundation

public struct HomeAPI: AbstractAPI {
    public static var instance: HomeAPI { HomeAPI() }
}

public extension HomeAPI {
    private var userId: String {
        "\(UserData.shared.user.userID ?? 0)"
    }
    private var endPoint: AbstractAPIEndPoint {
        return AbstractAPIEndPoint(path: APIClient.shared?.path?.dashboard.graphData ?? "",
                                   method: .POST,
                                   body: ["userId": userId])
    }
    
    func fetchGraphData() async -> Result<GraphData, ResultError> {
        switch await self.callAPI(endPoint: endPoint) {
        case .success(let data):
            guard let data = data else {
                return .failure(.unknown)
            }
            if let model = try? data.decode(GraphData.self).get() {
                return .success(model)
            } else {
                switch data.lowerCasedKeysData.decode(GenericModel.self) {
                case .success(let model):
                    if let errorMessage = model.message {
                        //show alert
                        return .failure(.errorMessage(errorMessage))
                    }
                case .failure(let error):
                    return .failure(.errorMessage(error.localizedDescription))
                }
            }
            return .failure(.unknown)
        case .failure(let error):
            return .failure(error)
        }
    }
}
