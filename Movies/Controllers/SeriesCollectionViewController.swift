//
//  SeriesCollectionViewController.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 18/01/18.
//  Copyright © 2018 ARGCVC. All rights reserved.
//

import Foundation
import Kingfisher

class SeriesCollectionViewController: UICollectionViewController, UITabBarControllerDelegate{
    //class PhotosCollectionViewController: UITabBarController, UITabBarControllerDelegate, UICollectionViewDelegate {
    //var photoCategories: [PhotoCategory] = PhotosLibrary.fetchPhotos
    //var photoCategories: [PhotoCategory] = PhotosLibrary.fetchPhotos()
    var seriesByGender = [Gender]()
    
    
    // TODO erase if we wont use it again
    struct StoryboardInfo {
        static let identifierCell = "SerieViewCell"
        static let identifierHeader = "SerieHeaderView"
        static let identifierDetails = "ShowSerieDetailSegue"
        //static let identifierLogin = "LoginSegue"
        static let leftAndRigthPadding: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        //self.delegate = self
        super.viewDidLoad()
        
        //TODO: - change teh layout of the collection view
        let collectionViweWidth = collectionView?.frame.width
        let itemWidth = (collectionViweWidth! - 4*StoryboardInfo.leftAndRigthPadding) / StoryboardInfo.numberOfItemsPerRow
        let itemHeight = itemWidth * 1.5
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        seriesByGender = Gender.getAllSeriesByGender()
        //print(seriesByGender)
        //print("Im in series")
        
    }
    // MARK: - UICollectionViewDataSources
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //return photoCategories.count
        return seriesByGender.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return photoCategories[section].imageNames.count
        return seriesByGender[section].seriesList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardInfo.identifierCell, for: indexPath) as! MyCollectionViewCell
        //let photoCategory = photoCategories[indexPath.section]
        //let imageNames = photoCategory.imageNames
        //let imageName = imageNames[indexPath.item]
        
        print(seriesByGender[indexPath.section].seriesList[indexPath.item].name)
        cell.photoImageView.kf.setImage(with: seriesByGender[indexPath.section].seriesList[indexPath.item].collectionViewImageURL,
                                        placeholder: UIImage(named: "default-movie") )
        return cell
    }
    
    //SectionHeaderView
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoryboardInfo.identifierHeader, for: indexPath) as! MyCollectionReusableViewHeader
        //let category = photoCategories[indexPath.section]
        let category = seriesByGender[indexPath.section].name
        sectionHeaderView.categoryTitle = category
        
        return sectionHeaderView
        
    }
    
    //MARK: - UICollectionViewDelegate
    
    var selectedImage: UIImage!
    var selectedSection: String!
    var selectedSerieId: Int!
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let category = photoCategories[indexPath.section]
        //selectedImage = UIImage(named: category.imageNames[indexPath.item])
        //selectedSection = category.categoryImageName
        
        selectedSerieId = seriesByGender[indexPath.section].seriesList[indexPath.item].id
        
        // TODO change identifier
        performSegue(withIdentifier: StoryboardInfo.identifierDetails, sender: nil)
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardInfo.identifierDetails{
            
            // MySeriesDetailsViewController is the controller of view that series details
            let detailVC = segue.destination as! MySeriesDetailsViewController
            
            //detailVC.image = selectedImage
            //detailVC.sectionTitle = "Detallade pelicula"
            detailVC.serie = Serie.getSerieById(id: selectedSerieId)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let item = tabBarItem.tag
        print(item)
        
        //let item = tabBarController?.tabBar.selectedItem?.tag
        //tabBarController?.tabBar.selectedItem?.tag
        //let item = tabBarController?.selectedIndex
        //let item = tabBarController?.tabBar.selectedItem?.isEqual(0)
        //tabBarController?.tabBar.selectedItem?.isEqual(0)
        
        //print(item)
        /*        if item == 0{
         print("Im in movies")
         }
         else{
         print("Im in series")
         }
         */
        
    }
    
    
}
