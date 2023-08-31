//
//  OneSolutionTextfieldAPI.swift
//  OneSolutionUtility
//
//  Created by Sreekanth Reddy Tadi on 31/08/23.
//

import Foundation

@available(iOS 13.0.0, *)
public struct OneSolutionTextFieldAPI: AbstractAPI {
    public static var instance: OneSolutionTextFieldAPI { OneSolutionTextFieldAPI() }
}

public extension OneSolutionTextFieldAPI {

    func fetchData(with request: OneSolutionRequest) async -> Result<OneSolutionTextFieldModel, ResultError> {
        let endPoint = AbstractAPIEndPoint(path: request.url,
                                           method: .POST,
                                           body: request.reqParams as? [String : Any])
        switch await self.callAPI(endPoint: endPoint) {
        case .success(let responseData):
            guard let data = responseData else {
                return .failure(.unknown)
            }
            do {
                let model = try JSONDecoder().decode(OneSolutionTextFieldModel.self, from: data)
                if model.statusCode == 200 {
                    return .success(model)
                } else if let errorMessage = model.message {
                    //show alert
                    return .failure(.errorMessage(errorMessage))
                }
                return .failure(.unknown)
            } catch let error {
                //                print(log: String(describing: error))
                return .failure(.decode)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
