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
}
