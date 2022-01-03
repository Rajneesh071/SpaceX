//
//  SpaceXViewModel.swift
//  SpaceX
//
//  Created by Rajneesh on 09/03/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import Foundation
import Combine

class SpaceXViewModel : ObservableObject {
    @Published var launches: [Launch] = []
    let provider = ServiceProvider<SpaceXService>()
    
    func getAllLaunches() {
        
        provider.load(service: .allLaunches, decodeType: [Launch].self) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let items):
                self.launches = items
            case .failure(let error):
                print(error.localizedDescription)
            case .empty:
                print("No data")
            }
        }
    }
    
    
    // Just for learning, not related to spaceX
    func uploadData() {
        guard let data = prepareDataToUpload(yourData: "") else {
            return
        }
        
        // Just for learning, if you want to see the json string from data
        guard let prettyPrintedJson = String(data: data, encoding: .utf8) else {
            print("Error: Couldn't print JSON in String")
            return
        }
        
        provider.load(service: .uploadData(data)) { result in
            // Do your stuff
        }
    }
    
    func prepareDataToUpload(yourData:Any) -> Data? {
        let uploadValue = "Test" //yourData.uploadName
        let yourUploadDataModel:UploadDataModel = UploadDataModel(value: uploadValue)
        
        guard let jsonData = try? JSONEncoder().encode(yourUploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return nil
        }
        return jsonData
    }
    
}
// Just for learning, not related to spaceX
struct UploadDataModel: Codable {
    let value: String
}
