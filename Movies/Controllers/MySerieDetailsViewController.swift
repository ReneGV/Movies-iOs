//
//  MySerieDetailsViewController.swift
//  series
//
//  Created by Armando Corona Carrillo on 18/01/18.
//  Copyright © 2018 ARGCVC. All rights reserved.
//

import UIKit

class MySeriesDetailsViewController: UIViewController, UITabBarControllerDelegate, UITabBarDelegate {
    
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
    var labelSeasons: UILabel = UILabel()
    var labelSeasonsInfo: UILabel = UILabel()
    var labelChapters: UILabel = UILabel()
    var labelChaptersInfo: UILabel = UILabel()
    
    var serie: Serie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(serie.chapterAmount)
        //self.tabBarController?.delegate = MyDetailsViewController
        //tabBarController?.delegate = MyDetailsViewController() as! UITabBarController as? UITabBarControllerDelegate
        tabBarController?.delegate = self
        buildDetailScreen()
        //ImageView.image = serie.getDetailImage()
        navigationItem.title = serie.gender.name
        //print(serie.description)
        //self.tabBarController?.tabBar.isHidden = true
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    /*func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
     let tabBarIndex = tabBarController?.selectedIndex
     if tabBarIndex == 1 {
     print("Estoy en series")
     }
     else{
     print("I am in series")
     }
     }*/
    
    
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
        let colorBackground = MySeriesDetailsViewController.hexStringToUIColor(hex:"#D03235")
        //998DE7
        let textColor = MySeriesDetailsViewController.hexStringToUIColor(hex:"#000000")
        // "y" is used to set objects position
        
        self.scrollView.backgroundColor = colorBackground
        
        //Set properties of label that contains serie´s name
        self.labelName.frame = CGRect.init(x: spaceWidth*2, y: spaceHeight, width: screenWidth-(spaceWidth*4), height: spaceHeight*2)
        self.labelName.textAlignment = NSTextAlignment.center
        self.labelName.text = serie.name
        self.labelName.font = UIFont(name:"Arial" ,size: 24)
        self.labelName.textColor = textColor
        y = spaceHeight*4
        
        
        //Set properties of imageview that contains image detail
        self.ImageView.kf.setImage(with: serie.descriptionImageURL, placeholder: UIImage(named: "default-video-image"))
        self.ImageView.frame = CGRect.init(x: spaceWidth, y: CGFloat(y), width: screenWidth-(spaceWidth*2), height: screenHeight*(0.35))
        self.ImageView.alpha = 1
        y = y + screenHeight*(0.35)
        
        /*labelDescription.frame = CGRect.init(x: spaceWidth*2, y: CGFloat(y) + spaceHeight, width: (screenWidth/2 - spaceWidth*2), height: spaceHeight)
         labelDescription.textAlignment = NSTextAlignment.right
         labelDescription.text = "Descripción: "
         labelDescription.font = UIFont(name: "Arial", size: 12)*/
        
        
        ////Set properties of label that contains serie´s description
        self.labelDescriptionInfo.frame = CGRect.init(x: spaceWidth, y: CGFloat(y)+spaceHeight, width: screenWidth-spaceWidth*2, height: screenHeight*(0.50))
        self.labelDescriptionInfo.textAlignment = NSTextAlignment.justified
        self.labelDescriptionInfo.text = serie.description
        self.labelDescriptionInfo.font = UIFont(name: "Arial", size: letterSize)
        self.labelDescriptionInfo.numberOfLines = 0
        self.labelDescriptionInfo.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.labelDescriptionInfo.sizeToFit()
        self.labelDescription.textColor = textColor
        y = y + labelDescriptionInfo.frame.height + spaceHeight*2
        
        
        ////Set properties of labels that contains release date
        self.labelDate.frame = CGRect.init(x: screenWidth/2-2, y: y, width: -screenWidth/2 + spaceWidth, height: spaceHeight)
        self.labelDate.textAlignment = NSTextAlignment.right
        self.labelDate.text = "Fecha de Lanzamiento: "
        self.labelDate.font = UIFont(name: "Arial", size: letterSize)
        self.labelDate.textColor = textColor
        
        self.labelDateInfo.frame = CGRect.init(x: screenWidth/2, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        self.labelDateInfo.textAlignment = NSTextAlignment.left
        self.labelDateInfo.text = " " + obtainDate(originalDate: serie.productionDate)
        self.labelDateInfo.font = UIFont(name: "Arial", size: letterSize)
        self.labelDateInfo.textColor = textColor
        y = y + labelDateInfo.frame.height + spaceHeight
        
        
        ////Set properties of labels that contains seasons info
        self.labelSeasons.frame = CGRect.init(x: spaceWidth, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        self.labelSeasons.textAlignment = NSTextAlignment.right
        self.labelSeasons.text = "Temporadas: "
        self.labelSeasons.font = UIFont(name: "Arial", size: letterSize)
        self.labelSeasons.textColor = textColor
        
        self.labelSeasonsInfo.frame = CGRect.init(x: screenWidth/2, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        self.labelSeasonsInfo.textAlignment = NSTextAlignment.left
        self.labelSeasonsInfo.text = " " + String(serie.seasonsAmount)
        self.labelSeasonsInfo.font = UIFont(name: "Arial", size: letterSize)
        self.labelSeasonsInfo.textColor = textColor
        y = y + labelSeasons.frame.height + spaceHeight
        
        //Set proporties of labels that contains chapters info
        self.labelChapters.frame = CGRect.init(x: spaceWidth, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        self.labelChapters.textAlignment = NSTextAlignment.right
        self.labelChapters.text = "Capítulos: "
        self.labelChapters.font = UIFont(name: "Arial", size: letterSize)
        self.labelChapters.textColor = textColor
        
        self.labelChaptersInfo.frame = CGRect.init(x: screenWidth/2, y: y, width: screenWidth/2 - spaceWidth, height: spaceHeight)
        self.labelChaptersInfo.textAlignment = NSTextAlignment.left
        self.labelChaptersInfo.text = " " + String(serie.chapterAmount)
        self.labelChaptersInfo.font = UIFont(name: "Arial", size: letterSize)
        self.labelChaptersInfo.textColor = textColor
        y = y + labelChapters.frame.height + spaceHeight*2
        
        
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
        self.scrollView.addSubview(labelSeasons)
        self.scrollView.addSubview(labelSeasonsInfo)
        self.scrollView.addSubview(labelChapters)
        self.scrollView.addSubview(labelChaptersInfo)
    }
    
    // Function to truncate serie.date
    func obtainDate(originalDate:String)->String {
        let newDate = originalDate.components(separatedBy: "T")
        return newDate[0]
        
    }
    // Function to get color using hexadecimal value
    static private func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
