//
//  WebServices.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 07/01/18.
//  Copyright © 2018 ARGCVC. All rights reserved.
//

import Foundation
import UIKit

class WebServiceHandler {
    
    static let getAllMoviesURL = URL(string:"https://c20xw6hcc4.execute-api.us-east-1.amazonaws.com/prod/getAllMovies")
    static let getMovieInfoString = "https://c20xw6hcc4.execute-api.us-east-1.amazonaws.com/prod/getMovieInfo?id="
    
    static let getAllTvSeriesURL = URL(string:"https://c20xw6hcc4.execute-api.us-east-1.amazonaws.com/prod/getAllTvSeries")
    static let getSerieInfoString = "https://c20xw6hcc4.execute-api.us-east-1.amazonaws.com/prod/getSerieInfo?id="
    
    /*
     * Calls to API Gateway to get all movies info and
     * returns a dictionary containig all movies ordered by gender
     */
    static func getAllMoviesData() -> [String: [[String:Any]]]{
        do{
            // Get the data from URL
            let moviesData = try Data(contentsOf: getAllMoviesURL!,
                                options: [])
            // Parse the info into a dictionary ["GenderName" : [MovieDictionary] ]
            let allMoviesDict = (try JSONSerialization.jsonObject(with: moviesData, options: []) as? [String: [[String:Any]] ])!
            return allMoviesDict
        } catch {
            print(error.localizedDescription)
        }
        // Return empty dictionary if there's an error
        return [:]
    }
    
    /*
     * Get all movie data from id
     */
    static func getMovie(id:Int) ->[String:Any]{
        do{
            // Get the data from URL
            let singleMovieData = try Data(contentsOf: URL(string: getMovieInfoString + String(id))!,
                                      options: [])
            // Parse the info into a dictionary ["GenderName" : [MovieDictionary] ]
            let movieDict = (try JSONSerialization.jsonObject(with: singleMovieData, options: []) as? [String: Any])!
            return movieDict
        } catch {
            print(error.localizedDescription)
        }
        // Return empty dictionary if there's an error
        return [:]
    }
    
    /*
     * Get an UIImage from  an URL
     */
    static func getImageFromUrl(url:URL) -> UIImage{
        do{
            // Get data from URL
            let imageData = try Data(contentsOf: url, options: [])
            return UIImage(data: imageData)!
        }catch{
            print(error.localizedDescription)
        }
        return UIImage()
    }
    
    
    /*
     * Calls to API Gateway to get all series info and
     * returns a dictionary containig all series ordered by gender
     */
    static func getAllTvSeriesData() -> [String: [[String:Any]]]{
        do{
            // Get the data from URL
            let seriesData = try Data(contentsOf: getAllTvSeriesURL!,
                                      options: [])
            // Parse the info into a dictionary ["GenderName" : [MovieDictionary] ]
            let allSeriesDict = (try JSONSerialization.jsonObject(with: seriesData, options: []) as? [String: [[String:Any]] ])!
            //print(allSeriesDict)
            return allSeriesDict
        } catch {
            print(error.localizedDescription)
        }
        // Return empty dictionary if there's an error
        return [:]
    }
    
    //Get all serie info
    static func getSerie(id:Int) ->[String:Any]{
        do{
            // Get the data from URL
            let singleSerieData = try Data(contentsOf: URL(string: getSerieInfoString + String(id))!,
                                           options: [])
            // Parse the info into a dictionary ["GenderName" : [MovieDictionary] ]
            let serieDict = (try JSONSerialization.jsonObject(with: singleSerieData, options: []) as? [String: Any])!
            return serieDict
        } catch {
            print(error.localizedDescription)
        }
        // Return empty dictionary if there's an error
        return [:]
    }
}

