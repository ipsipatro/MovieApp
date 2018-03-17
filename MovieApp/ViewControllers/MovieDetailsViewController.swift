//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Ipsi Patro on 17/03/2018.
//  Copyright © 2018 Ipsi Patro. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var trailerCoverImageView: UIImageView!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLable: UILabel!
    
    @IBOutlet weak var ratingView: RatingView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    var movie: Movie?
    
    @IBOutlet weak var directorLable: UILabel!
    
    @IBOutlet weak var startsLable: UILabel!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        populateViews()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - private methods
    
    private func populateViews() {
        if let movie = self.movie {
            
            if let movieTitle = movie.title {
                movieTitleLable.text = movieTitle
            }
            
            if let rating = movie.rating {
                ratingView.rating = rating
            }
            
            if let trailerImageURL = movie.trailer_cover_url {
                if let image = Utility.getImageFromURL(trailerImageURL) {
                    trailerCoverImageView.image = image
                }
            }
            
            if let iconURL = movie.thumb_url {
                if let image = Utility.getImageFromURL(iconURL) {
                    thumbImageView.image = image
                }
            }
            
            if let description = movie.description {
                descriptionTextView.text = description
            }
            
            if let director = movie.director {
                directorLable.text = director
            }
            
            if let stars = movie.starring {
                startsLable.text = stars
            }
            
        }
    }
    // MARK: - Navigation
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "buyTicketSegue" {
            if let buyTicketViewController =  segue.destination as? BuyTicketViewController, let movie = self.movie {
                buyTicketViewController.movie = movie
            }
        }
    }
    
    
}
