//
//  SpaceXService.swift
//  SpaceX
//
//  Created by Rajneesh on 08/03/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import Foundation

enum SpaceXService {
    case allLaunches
}

extension SpaceXService: Service {
    var baseURL: String {
        return "https://api.spacexdata.com"
    }

    var path: String {
        switch self {
        case .allLaunches:
            return "/v2/launches"
        }
    }

    var parameters: [String: Any]? {
        // default params
        let params: [String: Any] = [:]
        
        switch self {
        case .allLaunches:
            break
        }
        return params
    }

    var method: ServiceMethod {
        return .get
    }
}
