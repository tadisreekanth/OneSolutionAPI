//
//  EndPoint.swift
//
//  Created by sreekanth reddy Tadi on 03/08/22.
//

import Foundation
import OneSolutionUtility

protocol APIEndPoint {
    var path    :   String? { set get }
    var method  :   RequestMethod {set get}
    var header  :   [String: String]? {set get}
    var body    :   [String: Any]? {set get}
}

extension APIEndPoint {
    var encryptedBody: Data? {
        guard let body = body else {
            return nil
        }
        guard let data = try? JSONSerialization.data(withJSONObject: body, options: []) else {
            return nil
        }
        return data.encryptedData
    }
    
    var url: URL? {
        guard let base = APIClient.shared?.route?.value else { return nil }
        guard let urlString = path,
              let url = URL(string: [base, urlString].joinedUrl)
        else { return nil }
        return url
    }
}
