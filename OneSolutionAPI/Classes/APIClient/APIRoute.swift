//
//  ServiceURL.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 02/07/23.
//

import Foundation

public protocol APIRoute: AnyObject {
    var value: String { get }
}

public protocol APIPath: AnyObject {
    var login: String { get }
}
