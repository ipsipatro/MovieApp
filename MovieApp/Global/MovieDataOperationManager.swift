//
//  MovieDataOperationManager.swift
//  MovieApp
//
//  Created by Ipsi Patro on 17/03/2018.
//  Copyright © 2018 Ipsi Patro. All rights reserved.
//

import UIKit

struct MovieDescription: Decodable {
    let status: String?
    let results: [Movie]
}

class MovieDataOperationManager: NSObject {
    
    static let sharedInstance = MovieDataOperationManager()
    
    fileprivate override init() {}
    
    var movies: [Movie]?
    
    
    // MARK: - Public
    
    func getMovieList(completion: @escaping () -> () = {}) {
            let urlString = "https://static.grabble.com/misc/ios-test/movies.json?2018"
            guard let url = URL(string: urlString) else {
                completion()
                return
                
            }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                }else {
                    guard let data = data else{return}
                    do {
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(MovieDescription.self, from: data)
                        print(movies.status ?? "")
                        self.movies = movies.results
                    }catch let errorCondition {
                        print("error is \(errorCondition)")
                    }
                    
                }
                completion()
                }.resume()
        }

}
