//
//  Service.swift
//  SpaceX
//
//  Created by Rajneesh on 08/03/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import Foundation

enum ServiceMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Service {
    var headers: [String: Any]? { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var method: ServiceMethod { get }
    var body: Data? { get }
}

extension Service {
    public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("URL could not be built")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if !headers.isEmpty {
            headers.forEach { (key, value) in
                request.addValue(value as! String, forHTTPHeaderField: key)
            }
        }
        
        if (method == .post) {
            if let body = body {
                //print("make body: \(String(data: body, encoding: .utf8) ?? "")")
                request.httpBody = body
            }
        }
        
        return request
    }

    private var url: URL? {
        guard var urlComponents = URLComponents(string: baseURL) else {
           return nil
        }
        urlComponents.path = urlComponents.path + path

        //if method == .get {
            // add query items to url
            guard let parameters = parameters as? [String: String] else {
                fatalError("parameters for GET http method must conform to [String: String]")
            }
            if parameters.count > 0 {
                urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
            }
        //}
        return urlComponents.url
    }
}

extension Service {
    
    var parameters: [String: Any] {
        return [:]
    }
    var headers: [String: Any] {
        return [:]
    }
}
