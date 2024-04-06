//
//  File.swift
//  OneSolution
//
//  Created by sreekanth reddy Tadi on 08/11/22.
//

import Foundation

public struct OneSolutionRequest {
    
    public var url = ""
    public var reqParams: [String: Any]?
    public var searchKey: String?
    
    public var responseObject: NSDictionary?
    
    public var selectedObject: OneSolutionModel?
    
    public init() {
        url = ""
        reqParams = [:]
        searchKey = ""
    }
    
    public init(url_String: String, requestParams: [String: Any], searchValueKey: String) {
        url = url_String
        reqParams = requestParams
        searchKey = searchValueKey
    }
}

public extension OneSolutionRequest {
    
    mutating func updateRequestParams(requestParams: [String: Any]) {
        reqParams = requestParams
    }
    
    mutating func update(value: Any, for key: String) {
        reqParams?[key] = value
    }
    
    mutating func setReponse (_ serviceResponse: NSDictionary?) -> Void {
        if let serResponse = serviceResponse {
            self.responseObject = serResponse
        }else {
            self.responseObject = nil
        }
    }
    
    mutating func update(_ seleted: OneSolutionModel?) -> Void {
        if let obj = seleted {
            self.selectedObject = obj
        }else {
            self.selectedObject = nil
        }
    }
}
