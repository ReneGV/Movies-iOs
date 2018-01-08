//
//  VideoMedia.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 07/01/18.
//  Copyright © 2018 ARGCVC. All rights reserved.
//

import Foundation
import UIKit

/**
 *
 */

class VideoMedia{
    var id = 0
    var name = ""
    var productionDate = ""
    var description = ""
    var collectionViewImageURL = URL(string: "")
    var descriptionImageURL = URL(string: "")
    var gender = Gender()
    var movieLength = 0
    
    init(collectionViewImageURL:String, name:String){
        self.collectionViewImageURL = URL(string: collectionViewImageURL)
        self.name = name
    }
    
    init(name:String, description:String,descriptionImage:String,
         productionDate:String, gendername:String){
        self.name = name
        self.description = description
        self.descriptionImageURL = URL(string:descriptionImage)
        self.productionDate = productionDate
        self.gender = Gender(name:gendername)
    }
    
    //TODO buscar en el local storage o aun buffer de memoria la imagen
    // si existe la imagen cargar esa imagen
    // de lo contrario descargarla y guardarla en el buffer
    
    func getCollectionViewImage() -> UIImage{
            return WebServiceHandler.getImageFromUrl(url: self.collectionViewImageURL!)
    }
    
    func getDetailImage()->UIImage{
        return WebServiceHandler.getImageFromUrl(url: self.descriptionImageURL!)
    }
}
