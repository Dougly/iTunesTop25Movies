//
//  ImageDownloader.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/12/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }

    func downloadPosterImage(completion: @escaping () -> Void) {
        guard let posterImageURLString = movie.posterImageURLString else { return}
        let url = URL(string: posterImageURLString)
        let session = URLSession.shared
        
        if let url = url {
            session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let data = data {
                    let responseImageData = UIImage(data: data)
                    if let image = responseImageData {
                        self.movie.state = .downloaded
                        self.movie.posterImage = image
                        completion()
                    } else {
                        print("could not convert data to image")
                        self.movie.state = .failed
                        self.movie.posterImage = #imageLiteral(resourceName: "brokenImage")
                        completion()
                    }
                } else {
                    self.movie.posterImage = #imageLiteral(resourceName: "brokenImage")
                    completion()
                }
            }).resume()
        }
    }
    
}
