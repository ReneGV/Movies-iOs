//
//  Photos.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 15/11/17.
//  Copyright © 2017 ARGCVC. All rights reserved.
//

import Foundation

/**
 * struct PhotoCategory: A generealized model of acell in the main view
 *
 * categoryImageName: Representes whethere the images is a movie or a TV series
 * title:             Representes whether the image is a movie or a TV series
 * imageNames:        Represents the image name
 *
 * -todo: Improve the model in order to contain more info
 */

struct  PhotoCategory {
    var categoryImageName: String
    var title: String
    var imageNames: [String]
    
}

/**
 * class PhotosLibtary : Class with the methods for fetching images and content
 *
 * -todo: Load info by calling a Web service
 */
class PhotosLibrary{
    
    /*
     * fetchPhotos: Returns the data of the images that are going to be loaded in the collection view
     */
    static func fetchPhotos() -> [PhotoCategory]{
        // Create a array of photos data
        var categories = [PhotoCategory]()
        // Get a dictionary with the content category and image name
        let photosData = PhotosLibrary.downloadPhotosData()
        // Iterate through a loop in order to load the dictionary data into the array
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
    
    /*
     * downloadPhotosData: Generates a dictionary with the images names and categories loades locally
     */
    
    class func downloadPhotosData() -> [String : Any]{
        let contentDictionary = ["Series":["categoryImageName":"Series", "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "s", numberOfImages: 7)],
                     "Movies":["categoryImageName":"Movies", "imageNames" : PhotosLibrary.generateImage(categoryPrefix: "m", numberOfImages: 5)]]
        return contentDictionary
    }
    
    /*
     *  func generateImage: generates a string array for searching images locally
     * -param categoryPrefix: string that represents the prefix
     * -param numberOfImages: max limit of results
     * -return: A string array, appending numbers eg. ["m1","m2","m3", "m4"]
     */
    private class func generateImage(categoryPrefix: String, numberOfImages: Int) -> [String]{
        var imageNames = [String]()
        
        for i in 1...numberOfImages{
            imageNames.append("\(categoryPrefix)\(i)")
        }
        return imageNames
    }
    
}
