//
//  ApiClient.swift
//  MVVMArchitecture
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import Foundation

// MARK: - ApiClient
final class ApiClient {
    class func request(url: URL,data: Data? = nil, httpMethod: String? = nil , completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        let configuration = URLSessionConfiguration.default
        let session = URLSession(
            configuration: configuration,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        
        let task = session.dataTask(with: request) {  data, response, error in do {
            if let data = data, let response = response { completion(data, response, error) }
            }
        }
        task.resume()
    }
}
