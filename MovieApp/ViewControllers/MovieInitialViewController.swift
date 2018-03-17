//
//  MovieInitialViewController.swift
//  MovieApp
//
//  Created by Ipsi Patro on 17/03/2018.
//  Copyright © 2018 Ipsi Patro. All rights reserved.
//

import UIKit

class MovieInitialViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var movies = [Movie]()
    
    fileprivate let itemsPerRow: CGFloat = 2
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        MovieDataOperationManager.sharedInstance.getMovieList {
            self.loadMovies()
        }
    }

    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviecell", for: indexPath as IndexPath) as! MovieCollectionViewCell
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.5
        cell.movie = movies[indexPath.row]
        return cell
    }
    
     // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieDetails" {
            if let movieDetailsViewController =  segue.destination as? MovieDetailsViewController {
                if let selectedIndexes = self.collectionView.indexPathsForSelectedItems {
                    let indexpath = selectedIndexes[0].row
                    movieDetailsViewController.movie = movies[indexpath]
                    
                }
                
            }
        }
    }
    
    // MARK: - private methods
    
    private func loadMovies() {
        if let movies = MovieDataOperationManager.sharedInstance.movies {
            self.movies = movies
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.collectionView.reloadData()
            }
        }
    }
    
}

extension MovieInitialViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: 300)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
