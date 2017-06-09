//
//  MovieListViewController.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/9/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    let sharedInstance = DataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        sharedInstance.fetchMovies()
    }
    
}
