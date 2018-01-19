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
    var seriesList:[Serie] = []
    
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
    
    
    static func getAllSeriesByGender() -> [Gender]{
        let allSeriesByGenderDictionary = WebServiceHandler.getAllTvSeriesData()
        //print(allSeriesByGenderDictionary)
        var genderListSeries:[Gender] = []
        for(genderName, seriesArray) in allSeriesByGenderDictionary{
            //print(genderName)
            let gender = Gender(name:genderName)
            //print(gender)
            for serie in seriesArray{
                print(seriesArray)
                gender.seriesList.append(Serie(id: serie["id"] as! Int,
                                               name: serie["name"] as! String,
                                               collectionViewImageURL: serie["collectionViewImage"] as! String))
            }
            //print(gender)
            genderListSeries.append(gender)
        }
        return genderListSeries
    }
}
