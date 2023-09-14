//
//  LoginAPI.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 30/06/23.
//

import Foundation
import UIKit
import OneSolutionUtility

@available(iOS 13.0.0, *)
public struct LoginAPI: AbstractAPI {
    public static var instance: LoginAPI { LoginAPI() }
}

public extension LoginAPI {
    private var appConstants: AppConstants? {
        APIClient.shared?.appConstants
    }
    private var path: String {
        APIClient.shared?.path?.login ?? ""
    }
    
    func loginWith(userName: String,
                   password: String) async -> Result<Login, ResultError> {
        let appVersion = appConstants?.appVersion ?? "1.0"
        let bundleVersion = appConstants?.buildVersion ?? "1.0"
        let params = NSMutableDictionary ()
        params.setValue(userName, forKey: "username")
        params.setValue(password, forKey: "password")
        await params.setValue(UIDevice.deviceID, forKey: "deviceid")
        params.setValue("", forKey: "devicetoken")
        params.setValue("iOS", forKey: "platform")
        params.setValue("\(appVersion) (\(bundleVersion))", forKey: "version")
        
        let endPoint = AbstractAPIEndPoint(path: path,
                                           method: .POST,
                                           body: params as? [String : Any])
        
        switch await self.callAPI(endPoint: endPoint) {
        case .success(let data):
            guard let data = data else { return .failure(.unknown) }
            if let model = data.decode(Login.self), model.statusCode == 200 {
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
