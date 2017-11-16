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
    var photoCategories: [PhotoCategory] = PhotosLibrary.fetchPhotos()
    
    struct StoryboardInfo {
        static let identifierCell = "MainViewCell"
        static let identifierHeader = "HeaderView"
        static let identifierDetails = "ShowDetailsSegue"
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
        
        
    }
    // MARK: - UICollectionViewDataSources
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCategories[section].imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardInfo.identifierCell, for: indexPath) as! MyCollectionViewCell
        let photoCategory = photoCategories[indexPath.section]
        let imageNames = photoCategory.imageNames
        let imageName = imageNames[indexPath.item]
        
        cell.imageName = imageName
        
        return cell
    }
    
    //SectionHeaderView
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoryboardInfo.identifierHeader, for: indexPath) as! MyCollectionReusableViewHeader
        let category = photoCategories[indexPath.section]
        sectionHeaderView.categoryTitle = category.title
        
        return sectionHeaderView
        
    }
    
    //MARK: - UICollectionViewDelegate
    
    var selectedImage: UIImage!
    var selectedSection: String!
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = photoCategories[indexPath.section]
        selectedImage = UIImage(named: category.imageNames[indexPath.item])
        selectedSection = category.categoryImageName
        performSegue(withIdentifier: StoryboardInfo.identifierDetails, sender: nil)
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardInfo.identifierDetails{
            let detailVC = segue.destination as! MyDetailsViewController
            detailVC.image = selectedImage
            detailVC.sectionTitle = selectedSection
        }
    }
    
    
}
