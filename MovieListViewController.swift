//
//  MovieListViewController.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/9/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieListTableView: UITableView!
    let dataStore = DataStore.sharedInstance


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Top 25 Movies"
        dataStore.fetchMovies {
            DispatchQueue.main.async {
                self.movieListTableView.reloadData()
            }
        }
    }
    
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell")
        cell?.textLabel?.text = dataStore.movies[indexPath.row].title
        return cell!
    }
    
}
