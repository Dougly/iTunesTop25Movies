//
//  DataStore.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/9/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class DataStore {
    
    static let sharedInstance = DataStore()
    private init() {}
    
    let top25MoviesURL = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
    var movies: [Movie] = []
    
    // TODO: Move this to NSOperation custom class
    func fetchMovies() {
        ITunesAPIClient.getMovieInfo(fromURL: top25MoviesURL) { (top25movies) in
            for movie in top25movies {
                let movie = Movie(with: movie)
                self.movies.append(movie)
            }
        }
    }
    
    
}
