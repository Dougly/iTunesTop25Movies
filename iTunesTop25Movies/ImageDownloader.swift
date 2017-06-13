//
//  ImageDownloader.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/12/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class ImageDownloader: Operation {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    
    override func main() {
        if self.isCancelled { return }
        downloadPosterImage { (image) in
            if self.isCancelled { return }
            if image != nil {
                self.movie.posterImage = image
                self.movie.state = .downloaded
            } else {
                self.movie.state = .failed
            }
        }
    }


    private func downloadPosterImage(completion: @escaping (UIImage?) -> Void) {
        guard let posterImageURLString = movie.posterImageURLString else { return}
        let url = URL(string: posterImageURLString)
        let session = URLSession.shared
        
        if let url = url {
            session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let data = data {
                    let responseImageData = UIImage(data: data)
                    if let image = responseImageData {
                        completion(image)
                    } else {
                        print("could not convert data to image")
                    }
                } else {
                    completion(nil)
                }
            }).resume()
        }
    }
    
}
