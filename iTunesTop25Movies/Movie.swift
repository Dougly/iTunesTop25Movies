//
//  Movie.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/9/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class Movie {
    
    var title: String?
    var price: String?
    var releaseDate: String?
    var posterImageURLString: String?
    var posterImage: UIImage?
    var state: MovieState = .new
    
    init(with json: [String : Any]) {
        // Title
        let titleDictionary = json["im:name"] as? [String : String]
            let title = titleDictionary?["label"]
            self.title = title
        
        // Price
        let priceDictionary = json["im:price"] as? [String : Any]
        let price = priceDictionary?["label"] as? String
        self.price = price
        
        // Release Date
        let dateDictionary = json["im:releaseDate"] as? [String : Any]
        let dateStringDict = dateDictionary?["attributes"] as? [String : String]
        if let dateStringDict = dateStringDict {
            let date = dateStringDict["label"]
            self.releaseDate = date
        }
        
        // Poster Image URL String
        let imageDictionary = json["im:image"] as? [[String : Any]]
        let imageURL = imageDictionary?[2]["label"] as? String
        self.posterImageURLString = imageURL
    }
    
    
}


// This enum contains all the possible states a movie record can be in
enum MovieState {
    case new, downloaded, failed
}
