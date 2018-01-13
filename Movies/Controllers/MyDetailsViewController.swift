//
//  MyDetailsViewController.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 15/11/17.
//  Copyright © 2017 ARGCVC. All rights reserved.
//

import UIKit

class MyDetailsViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    var sectionTitle: String!
    var scrollView:UIScrollView = UIScrollView()
    var labelName: UILabel = UILabel()
    var labelNameInfo: UILabel = UILabel()
    var image: UIImage!
    var labelDescription: UILabel = UILabel()
    var labelDescriptionInfo: UILabel = UILabel()
    var labelDate: UILabel = UILabel()
    var labelDateInfo: UILabel = UILabel()
    var labelLengthOrSeasons: UILabel = UILabel()
    var labelLengthOrSeasonsInfo: UILabel = UILabel()
    var labelChapters: UILabel = UILabel()
    var labelChaptersInfo: UILabel = UILabel()
    
    

    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildDetailScreen()
        //ImageView.image = movie.getDetailImage()
        navigationItem.title = movie.gender.name
        //print(movie.description)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func buildDetailScreen(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let spaceWidth = screenWidth/40
        let spaceHeight = screenHeight/40
        var x:Double = 0
        var y:CGFloat = 0
        print(screenSize)
        print(screenWidth)
        print(screenHeight)
        print(spaceWidth)
        print(spaceHeight)
        
        self.scrollView.frame = CGRect.init(x:0, y:45, width:screenWidth, height:screenHeight-45)
        
        
        self.labelName.frame = CGRect.init(x: spaceWidth*2, y: spaceHeight, width: screenWidth-(spaceWidth*4), height: spaceHeight*2)
        self.labelName.textAlignment = NSTextAlignment.center
        self.labelName.text = movie.name
        self.labelName.font = UIFont(name:"Arial" ,size: 24)
        y = spaceHeight*4
        
        ImageView.image = movie.getDetailImage()
        ImageView.frame = CGRect.init(x: spaceWidth, y: CGFloat(y), width: screenWidth-(spaceWidth*2), height: screenHeight*(0.35))
        ImageView.alpha = 0.7
        y = y + screenHeight*(0.35)
        
        /*labelDescription.frame = CGRect.init(x: spaceWidth*2, y: CGFloat(y) + spaceHeight, width: (screenWidth/2 - spaceWidth*2), height: spaceHeight)
        labelDescription.textAlignment = NSTextAlignment.right
        labelDescription.text = "Descripción: "
        labelDescription.font = UIFont(name: "Arial", size: 12)*/
        
        labelDescriptionInfo.frame = CGRect.init(x: spaceWidth, y: CGFloat(y)+spaceHeight, width: screenWidth-spaceWidth*2, height: screenHeight*(0.50))
        labelDescriptionInfo.textAlignment = NSTextAlignment.center
        labelDescriptionInfo.text = movie.description
        labelDescriptionInfo.font = UIFont(name: "Arial", size: 18)
        labelDescriptionInfo.numberOfLines = 0
        labelDescriptionInfo.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelDescriptionInfo.sizeToFit()
        y = y + labelDescriptionInfo.frame.height + spaceHeight*2
    
        //labelDate.frame = CGRect.init(x: spaceWidth, y: y, width: screenWidth/2 - spaceWidth, height: 1)
        labelDate.frame = CGRect.init(x: screenWidth/2, y: y, width: -screenWidth/2 + spaceWidth, height: spaceHeight)
        labelDate.textAlignment = NSTextAlignment.right
        labelDate.text = "Fecha de Lanzamiento: "
        labelDate.font = UIFont(name: "Arial", size: 1)
        //labelDate.numberOfLines = 0
        //labelDate.lineBreakMode = NSLineBreakMode.byWordWrapping
        //labelDate.sizeToFit()
        //labelDate.frame.width = screenWidth/2-spaceWidth
        
        
        labelDateInfo.frame = CGRect.init(x: screenWidth/2, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        labelDateInfo.textAlignment = NSTextAlignment.left
        labelDateInfo.text = movie.productionDate
        labelDateInfo.font = UIFont(name: "Arial", size: 18)
        //labelDateInfo.numberOfLines = 0
        //labelDateInfo.lineBreakMode = NSLineBreakMode.byWordWrapping
        //labelDateInfo.sizeToFit()
        //print(movie.productionDate)
        y = y + labelDateInfo.frame.height// + spaceHeight*2
        
        labelLengthOrSeasons.frame = CGRect.init(x: spaceWidth, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        labelLengthOrSeasons.textAlignment = NSTextAlignment.right
        labelLengthOrSeasons.text = "Duración: "
        labelLengthOrSeasons.font = UIFont(name: "Arial", size: 18)
        
        labelLengthOrSeasonsInfo.frame = CGRect.init(x: screenWidth/2, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        labelLengthOrSeasonsInfo.textAlignment = NSTextAlignment.left
        labelLengthOrSeasonsInfo.text = String(movie.length)
        labelLengthOrSeasonsInfo.font = UIFont(name: "Arial", size: 18)
        
        
        
        
        
        
        
        
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(labelName)
        self.scrollView.addSubview(ImageView)
        self.scrollView.addSubview(labelDescription)
        self.scrollView.addSubview(labelDescriptionInfo)
        self.scrollView.addSubview(labelDate)
        self.scrollView.addSubview(labelDateInfo)
        self.scrollView.addSubview(labelLengthOrSeasons)
        self.scrollView.addSubview(labelLengthOrSeasonsInfo)
        
        //self.scrollView.contentSize = CGSize.init(width: screenWidth, height: screenHeight)
        
        
        
        //scrollView.
        //ImageView.image.
        
    }
}
