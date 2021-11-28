//
//  Utility.swift
//  Merchandising
//
//  Created by Poonam on 26/11/21.
//

import Foundation
import UIKit
import Network

enum CustomError: Error {
    case noInternetConnection
}


class Utils {

    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    static func isInternetConnectionAvailable() -> Bool {
        var isAvailable = true;
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                isAvailable = true;
            } else {
                isAvailable = false;
            }
        }

        monitor.start(queue: queue)
        return isAvailable;
    }
   
}


extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return NSLocalizedString("Please check internet connection on your device", comment: "No Network Connection")
        }
    }
}
