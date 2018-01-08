//
//  Movies.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 07/01/18.
//  Copyright © 2018 ARGCVC. All rights reserved.
//

import Foundation

/**
 * Movie : 
 * length: Movie lenth in minutes.
 */
 
class Movie:VideoMedia{
    var movieId = 0
    var length = 0
    
    // Cosntructor for collection view
    init(id:Int, name:String, collectionViewImageURL:String, movielength:Int){
        super.init(collectionViewImageURL:collectionViewImageURL, name:name)
        self.id = id
        self.name = name
    }
    
    init(id:Int, name:String, description:String, descriptionImage:String, movielength:Int, productionDate:String,
         gendername:String, movieLength:Int){
        super.init(name:name, description:description,descriptionImage:descriptionImage,
                       productionDate:productionDate, gendername:gendername)
        self.movieId = id
        self.length = movieLength
    }
    
    static func getMovieById(id:Int) -> Movie{
        var movieDict = WebServiceHandler.getMovie(id: id)
        return Movie(id:movieDict["id"] as! Int,
                     name:movieDict["name"] as! String,
                     description:movieDict["description"] as! String,
                     descriptionImage:movieDict["descriptionImage"] as! String,
                     movielength:movieDict["movieLength"] as! Int,
                     productionDate:movieDict["productionDate"] as! String,
                     gendername:movieDict["genderName"] as! String,
                     movieLength:movieDict["movieLength"] as! Int)
    }

}

