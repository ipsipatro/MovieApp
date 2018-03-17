//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Ipsi Patro on 17/03/2018.
//  Copyright © 2018 Ipsi Patro. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieIcon: UIImageView!
    
    @IBOutlet weak var ratingview: RatingView!
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else{
                return
            }
            if let imageurl = movie.thumb_url {
                movieIcon.image = Utility.getImageFromURL(imageurl)
            }
            
            if let title = movie.title {
                movieName.text = title
            }
            
            if let rating = movie.rating {
                ratingview.rating = rating
            }
            
        }
    }
}
