//
//  HttpClient.swift
//  Merchandising
//
//  Created by Poonam on 27/11/21.
//

import Foundation
import UIKit

class HttpClient {
    
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }

    func get( url: URL, callback: @escaping completeClosure ) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }
}
