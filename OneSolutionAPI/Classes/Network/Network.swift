//
//  Network.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 30/06/23.
//

import Network

public class Network {
    public static let shared = Network()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    private var connected: Bool = false
    
    public static var isReachable: Bool {
        return Network.shared.connected
    }
    
    public init() { self.checkNetworkConnection() }
    
    private func checkNetworkConnection () {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.connected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
}
