//
//  APIClient.swift
//  OneSolution
//
//  Created by sreekanth reddy Tadi on 23/09/22.
//  Copyright © 2022 Sreekanth Reddy. All rights reserved.
//

import Foundation

typealias APIResult = Result<Data, ResultError>

protocol APIService {
    @available(iOS 13.0.0, *)
    func call(endPoint: APIEndPoint) async -> Result<Data?, ResultError>
}

extension APIService {
    
    @available(iOS 13.0.0, *)
    func call(endPoint: APIEndPoint) async -> Result<Data?, ResultError> {
        
        guard let url = endPoint.url else { return .failure(.invalidURL) }
                
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.header
        if let body = endPoint.encryptedBody {
            request.httpBody = body
        }
        
        let urlSessionConfiguration = URLSessionConfiguration.default
        urlSessionConfiguration.requestCachePolicy = .reloadIgnoringCacheData
        urlSessionConfiguration.timeoutIntervalForRequest = 60.0
        
        if #available(iOS 15.0, *) {
            do {
                let (data, response) = try await URLSession(configuration: urlSessionConfiguration).data(for: request)
                return responseData(data: data,
                                    response: response)
            } catch let error {
                return .failure(.errorMessage(error.localizedDescription))
            }
        } else {
            // Fallback on earlier versions
            do {
                return try await withCheckedThrowingContinuation({ continuation in
                    URLSession(configuration: urlSessionConfiguration).dataTask(with: request) { data, response, error in
                        let result = responseData(data: data,
                                                  response: response,
                                                  error: error)
                        continuation.resume(returning: result)
                    }.resume()
                })
            } catch let error {
                return .failure(.errorMessage(error.localizedDescription))
            }
        }
    }
    
    private func responseData(data: Data?, response: URLResponse?, error:Error? = nil) -> Result<Data?, ResultError> {
        guard let _ = error else {
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return .failure(.noResponse)
            }
            return .success(data)
        }
        return .failure(.errorMessage(error?.localizedDescription ?? ""))
    }
}
