//
//  MovieCell.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/12/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    let movieCellView = MovieCellView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentView.addSubview(movieCellView)
        self.setEqualConstraints(for: movieCellView)
    }
    
}
