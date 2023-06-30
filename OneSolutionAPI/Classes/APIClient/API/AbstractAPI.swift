//
//  AbstractAPI.swift
//  OneSolution
//
//  Created by sreekanth reddy Tadi on 03/10/22.
//  Copyright © 2022 Sreekanth Reddy. All rights reserved.
//

import Foundation

protocol AbstractAPI: APIClient {
    @available(iOS 13.0.0, *)
    func callAPI(endPoint: APIEndPoint, showActivity: Bool) async -> Result<Data?, ResultError>
}

extension AbstractAPI {
    @available(iOS 13.0.0, *)
    func callAPI(endPoint: APIEndPoint, showActivity: Bool = true) async -> Result<Data?, ResultError> {
        guard let _ = endPoint.url else {
            return .failure(.invalidURL)
        }
        guard Network.isReachable else {
            if showActivity {
//                showAlert(knetworkErrorMessage)
            }
            return .failure(.connectionReset)
        }
        if showActivity {
//            showActivityManager()
        }
        if endPoint.method == .POST {
//            print(log: endPoint.url?.absoluteString ?? "")
//            print(log: endPoint.body ?? "")
        }

        let result = await self.call(endPoint: endPoint)
        
        if showActivity {
//            hideActivityManager()
        }
        switch result {
        case .success(let data):
            let decryptedData = data?.decryptedData
//            print(log: endPoint.url?.absoluteString ?? "")
//            print(log: String(data: decryptedData ?? Data(), encoding: .utf8) ?? "")
            return .success(decryptedData)
        case .failure(let error):
            switch error {
            case .errorMessage(let errorMessage): break
//                print(log: endPoint.url?.absoluteString ?? "")
//                print(log: errorMessage)
            default:
                break
            }
            return result
        }
    }
}
