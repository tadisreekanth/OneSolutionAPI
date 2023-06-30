//
//  LoginAPI.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 30/06/23.
//

import Foundation
import UIKit

var kDeviceId: String {
    return UIDevice.current.identifierForVendor?.uuidString ?? ""
}

@available(iOS 13.0.0, *)
struct LoginAPI: AbstractAPI {
    static var instance: LoginAPI { LoginAPI() }
}

extension LoginAPI {
    
    func loginWith(userName: String,
                   password: String) async -> Result<Login, ResultError> {
        let params = NSMutableDictionary ()
        params.setValue(userName, forKey: "username")
        params.setValue(password, forKey: "password")
        params.setValue(kDeviceId, forKey: "deviceid")
        params.setValue("", forKey: "devicetoken")
        params.setValue("iOS", forKey: "platform")
        params.setValue("\(kAppVersion) (\(kAppBuild))", forKey: "version")
        
        let endPoint = AbstractAPIEndPoint(url: ServiceAPI.shared.URL_Login,
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
