//
//  GraphDataAPI.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 14/07/23.
//

import Foundation

struct HomeAPI: AbstractAPI {
    static var instance: HomeAPI { HomeAPI() }
}

extension HomeAPI {

    private var userId: String {
        "\(UserData.shared.user.userID ?? 0)"
    }
    
    func fetchGraphData() async -> Result<GraphData, ResultError> {
        let params = NSMutableDictionary ()
        params.setValue(userId, forKey: "userId")

        let endPoint = AbstractAPIEndPoint(path: APIClient.shared?.path?.graphData ?? "",
                                           method: .POST,
                                           body: params as? [String: Any])
        switch await self.callAPI(endPoint: endPoint) {
        case .success(let data):
            guard let data = data else {
                return .failure(.unknown)
            }
            if let model = data.decode(GraphData.self) {
                return .success(model)
            } else if let model = data.lowerCasedKeysData.decode(GenericModel.self) {
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
