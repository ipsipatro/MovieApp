//
//  Utility.swift
//  MovieApp
//
//  Created by Ipsi Patro on 17/03/2018.
//  Copyright © 2018 Ipsi Patro. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    class func getImageFromURL(_ url: String) -> UIImage? {
        var image: UIImage?
            if let imageurl = URL(string: url) {
                let data = try? Data(contentsOf: imageurl)
                if let data = data {
                    image = UIImage(data: data)
                }
            }
        return image
    }

}
