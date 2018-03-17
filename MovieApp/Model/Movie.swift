//
//  Movie.swift
//  MovieApp
//
//  Created by Ipsi Patro on 17/03/2018.
//  Copyright © 2018 Ipsi Patro. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var id: Int?
    var title: String?
    var rating: Int?
    var description: String?
    var director: String?
    var starring: String?
    var thumb_url: String?
    var trailer_cover_url: String?
    var ticket_url: String?
    var trailer_youtube_id: String?
    
}
