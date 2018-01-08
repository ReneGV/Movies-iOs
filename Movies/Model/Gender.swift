//
//  Gender.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 07/01/18.
//  Copyright © 2018 ARGCVC. All rights reserved.
//

import Foundation

class Gender {
    var id = 0
    var name = "undefined"
    var moviesList:[Movie] = []
    //TODO change VideoMedia for Series class
    var seriesList:[VideoMedia] = []
    
    // Default constructor
    init(){
    }
    
    // Specialized constructors
    init(name:String ){
        self.name = name
    }
    
    static func getAllMoviesByGender() -> [Gender]{
        let allMoviesByGenderDictionary = WebServiceHandler.getAllMoviesData()
        var genderList:[Gender] = []
        for(genderName, moviesArray) in allMoviesByGenderDictionary{
            let gender = Gender(name:genderName)
            for movie in moviesArray{
                gender.moviesList.append(Movie(id: movie["id"] as! Int,
                                               name: movie["name"] as! String,
                                               collectionViewImageURL: movie["collectionViewImage"] as! String,
                                               movielength: movie["movieLength"] as! Int))
            }
            genderList.append(gender)
        }
        return genderList
    }
}
