//
//  MyDetailsViewController.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 15/11/17.
//  Copyright © 2017 ARGCVC. All rights reserved.
//

import Foundation
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
    var labelLength: UILabel = UILabel()
    var labelLengthInfo: UILabel = UILabel()
    //var labelChapters: UILabel = UILabel()
    //var labelChaptersInfo: UILabel = UILabel()
    
    

    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildDetailScreen()
        
        navigationItem.title = movie.gender.name
        
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
    
    override func viewWillAppear(_ animated: Bool) {
    
    }

    func buildDetailScreen(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let spaceWidth = screenWidth/40
        let spaceHeight = screenHeight/40
        var y:CGFloat = 0
        let letterSize:CGFloat = 14
        let colorBackground = Colors.hexStringToUIColor(hex:"FFFFFF")
        let textColor = Colors.hexStringToUIColor(hex:"#000000")
        // "y" is used to set objects position
        
        self.scrollView.backgroundColor = colorBackground
     
        //Set properties of label that contains movie´s name
        self.labelName.frame = CGRect.init(x: spaceWidth*2, y: spaceHeight, width: screenWidth-(spaceWidth*4), height: spaceHeight*2)
        self.labelName.textAlignment = NSTextAlignment.center
        self.labelName.text = movie.name
        self.labelName.font = UIFont(name:"Arial" ,size: 24)
        self.labelName.textColor = textColor
        y = spaceHeight*4
        
        
        //Set properties of imageview that contains image detail
        self.ImageView.kf.setImage(with: movie.descriptionImageURL, placeholder: UIImage(named: "default-video-image"))
        self.ImageView.frame = CGRect.init(x: spaceWidth, y: CGFloat(y), width: screenWidth-(spaceWidth*2), height: screenHeight*(0.35))
        self.ImageView.alpha = 1
        y = y + screenHeight*(0.35)
        
        /*labelDescription.frame = CGRect.init(x: spaceWidth*2, y: CGFloat(y) + spaceHeight, width: (screenWidth/2 - spaceWidth*2), height: spaceHeight)
        labelDescription.textAlignment = NSTextAlignment.right
        labelDescription.text = "Descripción: "
        labelDescription.font = UIFont(name: "Arial", size: 12)*/
        
        
        ////Set properties of label that contains movie´s description
        self.labelDescriptionInfo.frame = CGRect.init(x: spaceWidth, y: CGFloat(y)+spaceHeight, width: screenWidth-spaceWidth*2, height: screenHeight*(0.50))
        self.labelDescriptionInfo.textAlignment = NSTextAlignment.justified
        self.labelDescriptionInfo.text = movie.description
        self.labelDescriptionInfo.font = UIFont(name: "Arial", size: letterSize)
        self.labelDescriptionInfo.numberOfLines = 0
        self.labelDescriptionInfo.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.labelDescriptionInfo.sizeToFit()
        self.labelDescription.textColor = textColor
        y = y + self.labelDescriptionInfo.frame.height + spaceHeight*2
        
        
        ////Set properties of labels that contains release date
        self.labelDate.frame = CGRect.init(x: screenWidth/2-2, y: y, width: -screenWidth/2 + spaceWidth, height: spaceHeight)
        self.labelDate.textAlignment = NSTextAlignment.right
        self.labelDate.text = "Fecha de Lanzamiento: "
        self.labelDate.font = UIFont(name: "Arial", size: letterSize)
        self.labelDate.textColor = textColor
        
        self.labelDateInfo.frame = CGRect.init(x: screenWidth/2, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        self.labelDateInfo.textAlignment = NSTextAlignment.left
        self.labelDateInfo.text = " " + obtainDate(originalDate: movie.productionDate)
        self.labelDateInfo.font = UIFont(name: "Arial", size: letterSize)
        self.labelDateInfo.textColor = textColor
        y = y + labelDateInfo.frame.height + spaceHeight
        
        
        ////Set properties of labels that contains length info
        self.labelLength.frame = CGRect.init(x: spaceWidth, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        self.labelLength.textAlignment = NSTextAlignment.right
        self.labelLength.text = "Duración: "
        self.labelLength.font = UIFont(name: "Arial", size: letterSize)
        self.labelLength.textColor = textColor
        
        self.labelLengthInfo.frame = CGRect.init(x: screenWidth/2, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        self.labelLengthInfo.textAlignment = NSTextAlignment.left
        self.labelLengthInfo.text = " " + String(movie.length) + " min"
        self.labelLengthInfo.font = UIFont(name: "Arial", size: letterSize)
        self.labelLengthInfo.textColor = textColor
        y = y + labelLength.frame.height + spaceHeight*2
        
        self.scrollView.frame = CGRect.init(x:0, y:0, width:screenWidth, height:screenHeight)
        self.scrollView.contentSize = CGSize.init(width: screenWidth, height:
            y + spaceHeight*2)
        //self.scrollView.contentSize = CGSize.init(width: screenWidth, height: y + spaceHeight*10)
        
        // Adding objects to be able to do scroll
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(labelName)
        self.scrollView.addSubview(ImageView)
        self.scrollView.addSubview(labelDescription)
        self.scrollView.addSubview(labelDescriptionInfo)
        self.scrollView.addSubview(labelDate)
        self.scrollView.addSubview(labelDateInfo)
        self.scrollView.addSubview(labelLength)
        self.scrollView.addSubview(labelLengthInfo)
    }
    
    // Function to truncate movie.date
    func obtainDate(originalDate:String)->String {
        let newDate = originalDate.components(separatedBy: "T")
        return newDate[0]
    }
    
    
}
