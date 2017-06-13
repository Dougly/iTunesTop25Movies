//
//  MovieDetailViewController.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/9/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    let dataStore = DataStore.sharedInstance
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = movie?.title
        
    }
    
    
    
    
    
   
}
