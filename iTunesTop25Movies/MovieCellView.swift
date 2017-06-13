//
//  MovieCellView.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/12/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class MovieCellView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        Bundle.main.loadNibNamed("MovieCellView", owner: self, options: nil)
        self.addSubview(contentView)
        self.setEqualConstraints(for: contentView)
    }
    
    
}
