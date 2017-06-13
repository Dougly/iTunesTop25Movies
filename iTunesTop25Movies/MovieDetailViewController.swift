//
//  MovieDetailViewController.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/9/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let dataStore = DataStore.sharedInstance
    var movie: Movie?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = movie?.title
        populateViews()
    }
    
    
    func populateViews() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        releaseDateLabel.text = movie?.releaseDate
        priceLabel.text = movie?.price
        
        if movie?.state == .new || movie?.state == .failed {
            if let movie = movie {
                let imageDownloader = ImageDownloader(movie: movie)
                imageDownloader.downloadPosterImage {
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.moviePosterImageView.image = movie.posterImage
                    }
                }
            }
        } else {
            self.activityIndicator.stopAnimating()
            self.moviePosterImageView.image = movie?.posterImage
        }
    }
    
    
    @IBAction func purchaseOnITunesTapped(_ sender: UIButton) {
        guard let itunesLink = movie?.itunesLink else { return }
        if let url = URL(string: itunesLink) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [UIApplicationOpenURLOptionUniversalLinksOnly : 1], completionHandler: nil)
            }
        }
    }
    
    
}
