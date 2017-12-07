//
//  ImageDisplayableTests.swift
//  ImageDisplayableTests
//
//  Created by Chandler De Angelis on 12/6/17.
//  Copyright © 2017 Chandler De Angelis. All rights reserved.
//

import XCTest
import Foundation
@testable import ImageDisplayable

class ImageDisplayableTests: XCTestCase, ImageDisplayable {
    
    var imageSession: URLSession = URLSession(configuration: .ephemeral)
    var expectation: XCTestExpectation!
    
    func testThatWrongMimeTypeReturnsNilImage() {
        let badUrl: URL = URL(string: "http://www.google.com")!
        self.expectation = self.expectation(description: "bad image test")
        self.download(at: badUrl) { [weak self] (image: UIImage?, error: Error?) in
            XCTAssertNotNil(error)
            XCTAssertNil(image)
            self?.expectation.fulfill()
        }
        self.waitForExpectations(timeout: 30) { error in
            if let unwrappedError: Error = error {
                XCTFail(unwrappedError.localizedDescription)
            }
        }
    }
    
    func testThatUrlReturnsImage() {
        let url: URL = URL(string: "https://picsum.photos/200")!
        self.expectation = self.expectation(description: "bad image test")
        self.download(at: url) { [weak self] (image: UIImage?, error: Error?) in
            XCTAssertNil(error)
            XCTAssertNotNil(image)
            self?.expectation.fulfill()
        }
        self.waitForExpectations(timeout: 30) { error in
            if let unwrappedError: Error = error {
                XCTFail(unwrappedError.localizedDescription)
            }
        }
    }
    
}
