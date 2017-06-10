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
                print("issue with url")
            }
        } else {
            print("Invalid filename/path.")
        }
        return []
    }()
    
    func testInit() {
        for item in sampleJSON {
            let movie = Movie(with: item)
            print(movie.title!)
        }
        
        
    }
    
    
}
