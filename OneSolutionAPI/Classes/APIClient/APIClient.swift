//
//  API.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 02/07/23.
//

import OneSolutionUtility

public class APIClient {
    
    private static var instance: APIClient?
    
    public class weak var shared: APIClient? {
        self.instance = self.instance ?? APIClient()
        return self.instance
    }
    
    public weak var appConstants: AppConstants?
    public weak var route: APIRoute?
    public weak var path: APIPath?
}
