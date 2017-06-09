//
//  Movie.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/9/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class Movie {
    
    let title: String
//    let releaseDate: String
//    let price: String
//    let posterURLString: String
    var posterImage: UIImage?
    
    init(with json: [String : Any]) {
        let titleDictionary = json["im:name"] as! [String : String]
        let title = titleDictionary["label"]!
        self.title = title
//        
//        let priceDictionary = json["im:price"] as! [String : String]
//        let price = priceDictionary["label"]!
//        self.price = price
//
//        let dateDictionary = json["im:releaseDate"] as! [String : Any]
//        let dateStringDictionary = dateDictionary["attributes"] as! [String : String]
//        let dateAsString =  dateStringDictionary["label"]!
//        self.releaseDate = dateAsString
//        
//        let imageDictionary = json["im:image"] as! [[String : Any]]
//        let imageURL = imageDictionary[2]["label"] as! String
//        self.posterURLString = imageURL
    }
    
}
