//
//  Serie.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 07/01/18.
//  Copyright © 2018 ARGCVC. All rights reserved.
//

import Foundation

class Serie:VideoMedia{
    var serieId = 0
    var seasonsAmount = 0
    var chapterAmount = 0
    var chapterLength = 0
    
    // Cosntructor for collection view
    init(id:Int, name:String, collectionViewImageURL:String, movielength:Int){
        super.init(collectionViewImageURL:collectionViewImageURL, name:name)
        self.id = id
        self.name = name
    }
    
    init(id:Int, name:String, description:String, descriptionImage:String, movielength:Int, productionDate:String,
         gendername:String, seasonsAmount:Int){
        super.init(name:name, description:description,descriptionImage:descriptionImage,
                   productionDate:productionDate, gendername:gendername)
        self.serieId = id
        self.seasonsAmount = seasonsAmount
        
    }
}
