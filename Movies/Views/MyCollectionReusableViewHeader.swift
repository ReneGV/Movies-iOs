//
//  MyCollectionReusableViewHeader.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 15/11/17.
//  Copyright © 2017 ARGCVC. All rights reserved.
//

import UIKit

class MyCollectionReusableViewHeader: UICollectionReusableView {
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    var categoryTitle: String! {
        didSet {
            categoryTitleLabel.text = categoryTitle
        }
    }
    
        
}
