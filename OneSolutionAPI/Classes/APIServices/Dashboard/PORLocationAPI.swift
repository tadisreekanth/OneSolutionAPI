//
//  PORLocation.swift
//  OneSolutionTextField
//
//  Created by Sreekanth Reddy Tadi on 19/03/24.
//

import Foundation

public struct PORLocationAPI: AbstractAPI {
    public static var instance: PORLocationAPI { PORLocationAPI() }
}

public extension PORLocationAPI {
    
    func fetch(with body: [String: Any]) async -> Result<[PORLocationGeneral], ResultError> {
        let endPoint = AbstractAPIEndPoint(path: APIClient.shared?.path?.generalPORLocation.serialDetails ?? "",
                                           method: .POST,
                                           body: body)
        switch await self.callAPI(endPoint: endPoint) {
        case .success(let data):
            guard let data = data else {
                return .failure(.unknown)
            }
            if let model = try? data.decode(PORLocations.self).get(), model.statusCode == 200 {
                return .success(model.locations ?? [])
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
            return .failure(.noData)
        case .failure(let error):
            return .failure(.errorMessage(error.localizedDescription))
        }
    }
    
    func fetchPreviousVins(with body: [String: Any]) async -> Result<PORLocationPreviousDetails, ResultError> {
        let endPoint = AbstractAPIEndPoint(path: APIClient.shared?.path?.generalPORLocation.previousVinDetails ?? "",
                                           method: .POST,
                                           body: body)
        switch await self.callAPI(endPoint: endPoint) {
        case .success(let data):
            guard let data = data else {
                return .failure(.unknown)
            }
            if let model = try? data.decode(PORLocationPreviousDetails.self).get(), model.statusCode == 200 {
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
            return .failure(.noData)
        case .failure(let error):
            return .failure(.errorMessage(error.localizedDescription))
        }
    }
}

public extension PORLocationAPI {
    
    func update(with body: [String: Any]) async -> Result<Bool, ResultError> {
        let endPoint = AbstractAPIEndPoint(path: APIClient.shared?.path?.generalPORLocation.update ?? "",
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
