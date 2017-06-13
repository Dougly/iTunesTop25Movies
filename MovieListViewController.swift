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
    var selectedRow = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Top 25 Movies"
        dataStore.fetchMovies {
            DispatchQueue.main.async {
                self.movieListTableView.reloadData()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let movieDetailViewController = segue.destination as! MovieDetailViewController
            movieDetailViewController.movie = dataStore.movies[selectedRow]
        }
    }
    
}


// Table View Delegate and DataSource
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell")
        cell?.textLabel?.text = dataStore.movies[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
}
