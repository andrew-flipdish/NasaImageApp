//
//  NasaImagesTestsAPI.swift
//  NasaImagesTestsAPI
//
//  Created by Andrew Teeters on 16/06/2021.
//

import XCTest

@testable import NasaImages

class NasaImagesTestsAPI: XCTestCase {
    
    var caller: ApiCaller?

    override func setUpWithError() throws {
        caller = ApiCaller()
    }

    override func tearDownWithError() throws {
        caller = nil
    }

    //Test that API doesn't return nil
    func testReturnNotNil() {
        var test: [NasaResponse]?
        let expectation = self.expectation(description: "Getting Response")
        caller!.callAPIWeek(startDate: String("2021-06-15")) { response in
            guard let response = response else {
                return

            }
            test = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotNil(test)
    }
    
    //Test that API returns an array of 7 objects
    func testReturnSevenItems() {
        var test: [NasaResponse]?
        let expectation = self.expectation(description: "Getting Response")
        caller!.callAPIWeek(startDate: String("2021-06-15&end_date=2021-06-21")) { response in
            guard let response = response else {
                return

            }
            test = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(test?.count, 7)
    }
    
}
