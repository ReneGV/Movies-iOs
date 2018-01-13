//
//  PhotosCollectionViewController.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 15/11/17.
//  Copyright © 2017 ARGCVC. All rights reserved.
//

import UIKit
class PhotosCollectionViewController: UICollectionViewController {
    //var photoCategories: [PhotoCategory] = PhotosLibrary.fetchPhotos
    //var photoCategories: [PhotoCategory] = PhotosLibrary.fetchPhotos()
    var moviesByGender = [Gender]()
    
    struct StoryboardInfo {
        static let identifierCell = "MainViewCell"
        static let identifierHeader = "HeaderView"
        static let identifierDetails = "ShowDetailsSegue"
        //static let identifierLogin = "LoginSegue"
        static let leftAndRigthPadding: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: - change teh layout of the collection view
        let collectionViweWidth = collectionView?.frame.width
        let itemWidth = (collectionViweWidth! - 4*StoryboardInfo.leftAndRigthPadding) / StoryboardInfo.numberOfItemsPerRow
        let itemHeight = itemWidth * 1.5
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        moviesByGender = Gender.getAllMoviesByGender()        
        
    }
    // MARK: - UICollectionViewDataSources
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //return photoCategories.count
        return moviesByGender.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return photoCategories[section].imageNames.count
        return moviesByGender[section].moviesList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardInfo.identifierCell, for: indexPath) as! MyCollectionViewCell
        //let photoCategory = photoCategories[indexPath.section]
        //let imageNames = photoCategory.imageNames
        //let imageName = imageNames[indexPath.item]
        
        print(moviesByGender[indexPath.section].moviesList[indexPath.item].name)
        cell.photoImageView.image = moviesByGender[indexPath.section].moviesList[indexPath.item].getCollectionViewImage()
        
        return cell
    }
    
    //SectionHeaderView
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoryboardInfo.identifierHeader, for: indexPath) as! MyCollectionReusableViewHeader
        //let category = photoCategories[indexPath.section]
        let category = moviesByGender[indexPath.section].name
        sectionHeaderView.categoryTitle = category
        
        return sectionHeaderView
        
    }
    
    //MARK: - UICollectionViewDelegate
    
    var selectedImage: UIImage!
    var selectedSection: String!
    var selectedMovieId:Int!
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let category = photoCategories[indexPath.section]
        //selectedImage = UIImage(named: category.imageNames[indexPath.item])
        //selectedSection = category.categoryImageName
        
        selectedMovieId = moviesByGender[indexPath.section].moviesList[indexPath.item].id
        
        performSegue(withIdentifier: StoryboardInfo.identifierDetails, sender: nil)
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardInfo.identifierDetails{
            let detailVC = segue.destination as! MyDetailsViewController
            //detailVC.image = selectedImage
            //detailVC.sectionTitle = "Detallade pelicula"
            detailVC.movie = Movie.getMovieById(id: selectedMovieId)
        }
    }
    
    
}
