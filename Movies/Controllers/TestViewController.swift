//
//  TestViewController.swift
//  Movies
//
//  Created by Armando Corona Carrillo on 07/01/18.
//  Copyright © 2018 ARGCVC. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        var moviesByGender = Gender.getAllMoviesByGender()
        image.image = moviesByGender.first?.moviesList.first?.getCollectionViewImage()
        for gender in moviesByGender{
            print(gender.name)
            
            for movie in gender.moviesList{
                print("->" + movie.name)
            }
        }
         */
        var movie = Movie.getMovieById(id:1)
        print(movie.name)
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

}
