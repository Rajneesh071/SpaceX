//
//  SpaceXTests.swift
//  SpaceXTests
//
//  Created by Rajneesh on 09/03/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import XCTest
@testable import SpaceX

class SpaceXTests: XCTestCase {
    let sessionNew = MockURLSession()
    
    override func setUp() {
        sessionNew.nextData = TestData.data
    }
    
    override func tearDown() {
        sessionNew.nextData = nil
    }
    
    func testNoLaunches() {
        let viewModel = SpaceXViewModel()
        XCTAssertEqual(viewModel.launches.count, 0, "Launches should not be there in beginning")
    }
    
    func testLaunches() {
        
        let viewModel = SpaceXViewModel()
        viewModel.provider.urlSession = sessionNew
        viewModel.getAllLaunches()
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            XCTAssertEqual(viewModel.launches.count, 2, "Launces count should be 2 as our mock data")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    func testLauncheName() {
        
        let viewModel = SpaceXViewModel()
        viewModel.provider.urlSession = sessionNew
        viewModel.getAllLaunches()
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            let name = viewModel.launches.first?.mission_name
            XCTAssertEqual(name, "FalconSat", "Seems like some issue in parsing the data")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
}
