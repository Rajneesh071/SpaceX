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
    case uploadData(Data)
}

extension SpaceXService: Service {
    var headers: [String : Any]? {
        [:]
    }
    
    var baseURL: String {
        return "https://api.spacexdata.com"
    }

    var path: String {
        switch self {
        case .allLaunches:
            return "/v2/launches"
        case .uploadData:
            return "/v2/launches"
        }
    }

    var parameters: [String: Any]? {
        // default params
        let params: [String: Any] = [:]
        
        /*
         If you are having default parameter
        let defaults = UserDefaults.standard
        params["auth_user_id"] = defaults.value(forKey: "user_id")
        params["username"] = defaults.value(forKey: "userName")
        params["api_key"] = defaults.value(forKey: "apikey")
        */
        
        switch self {
        case .allLaunches:
            break
        case .uploadData:
            break
        }
        
        return params
    }

    var method: ServiceMethod {
        switch(self) {
        case .allLaunches:
            return .get
        case .uploadData:
            return .post
        }
    }
    var body: Data? {
        switch(self) {
        
        case .allLaunches:
            return nil
        case .uploadData(let data):
            return data
        }
    }
}
