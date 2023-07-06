//
//  Network.swift
//  OneSolutionAPI
//
//  Created by sreekanth reddy Tadi on 30/06/23.
//

import Network

class Network {
    static let shared = Network()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    private var connected: Bool = false
    
    static var isReachable: Bool {
        return Network.shared.connected
    }
    
    init() { self.checkNetworkConnection() }
    
    private func checkNetworkConnection () {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.connected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
}
