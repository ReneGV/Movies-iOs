//
//  Photos.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 15/11/17.
//  Copyright © 2017 ARGCVC. All rights reserved.
//

import Foundation

struct  PhotoCategory {
    var categoryImageName: String
    var title: String
    var imageNames: [String]
    
}

class PhotosLibrary{
    
    static func fetchPhotos() -> [PhotoCategory]{
        var categories = [PhotoCategory]()
        let photosData = PhotosLibrary.downloadPhotosData()
        
        for (categoryTitle, dict) in photosData {
            if let dict = dict as? [String : Any]{
                let categoryImageName = dict["categoryImageName"] as! String
                if let imageNames = dict["imageNames"] as? [String] {
                    let newCategory = PhotoCategory(categoryImageName: categoryImageName, title: categoryTitle, imageNames: imageNames)
                    categories.append(newCategory)
                }
            }
        }
        return categories
    }
    
    class func downloadPhotosData() -> [String : Any]{
        let eldic = ["Series":["categoryImageName":"Series", "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "s", numberOfImages: 7)],
                     "Movies":["categoryImageName":"Movies", "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "m", numberOfImages: 5)]]
        return eldic
    }
    
    private class func generateImage(categoryPrefix: String, numberOfImages: Int) -> [String]{
        var imageNames = [String]()
        
        for i in 1...numberOfImages{
            imageNames.append("\(categoryPrefix)\(i)")
        }
        return imageNames
    }
    
}
