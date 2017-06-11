//
//  MovieTest.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/9/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import Foundation

import XCTest
@testable import iTunesTop25Movies

class MovieTest: XCTestCase {
    
    // Get local JSON for testing
    lazy var sampleJSON: [[String : Any]] = {
        
        if let path = Bundle(for: type(of: self)).path(forResource: "sampleJSON", ofType: "json") {
            do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url)
                let localJSON = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                let feed = localJSON["feed"] as! [String: Any]
                let entry = feed["entry"] as! [[String : Any]]
                return entry
            } catch {
                print("Invalid url")
            }
        } else {
            print("Invalid filename/path.")
        }
        return []
    }()
    
    // Test Movie Initializer
    func testInit() {
        
        var movies: [Movie] = []
        
        for item in sampleJSON {
            let movie = Movie(with: item)
            movies.append(movie)
        }
        
        // Test for nil values
        let expectedFirstTitle: String? = nil
        let expectedFirstPrice: String? = nil
        let expectedFirstReleaseDate: String? = nil
        let expectedFirstPosterImageURL: String? = nil
        
        let resultFirstTitle: String? = movies[0].title
        let resultFirstPrice: String? = movies[0].price
        let resultFirstReleaseDate: String? = movies[0].releaseDate
        let resultFirstPosterImageURL: String? = movies[0].posterImageURLString
        
        XCTAssert(expectedFirstTitle == resultFirstTitle, "Expected: \(String(describing: expectedFirstTitle)), got: \(String(describing: resultFirstTitle))")
        XCTAssert(expectedFirstPrice == resultFirstPrice,"Expected: \(String(describing: expectedFirstPrice)), got: \(String(describing: resultFirstPrice))")
        XCTAssert(expectedFirstReleaseDate == resultFirstReleaseDate, "Expected: \(String(describing: expectedFirstReleaseDate)), got: \(String(describing: resultFirstReleaseDate))")
        XCTAssert(expectedFirstPosterImageURL == resultFirstPosterImageURL, "Expected: \(String(describing: expectedFirstPosterImageURL)), got: \(String(describing: resultFirstPosterImageURL))")
        
        // Test non-nil values
        let expectedSecondTitle = "Logan"
        let expectedSecondPrice = "$14.99"
        let expectedSecondReleaseDate = "March 3, 2017"
        let expectedSecondPosterURL = "http://is2.mzstatic.com/image/thumb/Video117/v4/d1/69/35/d16935f1-38b1-eccd-e717-f8907ccb7afb/pr_source.lsr/170x170bb-85.jpg"
        
        let resultSecondTitle = movies[1].title
        let resultSecondPrice = movies[1].price
        let resultSecondReleaseDate = movies[1].releaseDate
        let resultSecondPosterURL = movies[1].posterImageURLString
    
        XCTAssert(expectedSecondTitle == resultSecondTitle, "Expected \(expectedSecondTitle) got: \(resultSecondTitle ?? "nil")")
        XCTAssert(expectedSecondPrice == resultSecondPrice, "Expected \(expectedSecondPrice) got: \(resultSecondPrice ?? "nil")")
        XCTAssert(expectedSecondReleaseDate == resultSecondReleaseDate, "Expected \(expectedSecondReleaseDate) got: \(resultSecondReleaseDate ?? "nil")")
        XCTAssert(expectedSecondPosterURL == resultSecondPosterURL, "Expected \(expectedSecondPosterURL) got: \(resultSecondPosterURL ?? "nil")")

    
    
    }
    
    
    
    
}
