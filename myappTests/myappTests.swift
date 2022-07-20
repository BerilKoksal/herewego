//
//  myappTests.swift
//  myappTests
//
//  Created by mobven on 19.07.2022.
//

import XCTest
@testable import myapp

protocol HTTPClient {
    func fetch(url: URL, completion: @escaping ((Data?, URLResponse, Error) -> Void))
}

class myappTests: XCTestCase {

    override func setUp() {
        // when each test case begins!
    }

    func testWhenImageViewShowsImageSuccessfully() {
        XCTAssertTrue(true)
    }

    func testWhenImageViewLoadingFails() {
        XCTAssertTrue(true)
    }

}
