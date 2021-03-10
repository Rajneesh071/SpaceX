//
//  TestData.swift
//  SpaceX
//
//  Created by Rajneesh on 09/03/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import Foundation
@testable import SpaceX

struct TestData {
    static let data: Data = {
        let url = Bundle.main.url(forResource: "TestData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return data
    }()
}
