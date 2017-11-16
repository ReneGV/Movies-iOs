//
//  ViewController.swift
//  Movies
//
//  Created by user130403 on 11/13/17.
//  Copyright © 2017 ARGCVC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let identifierLogin = "LoginSegue"

    @IBAction func buttonLoginFB(_ sender: Any) {
        performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
    
    @IBAction func buttonLoginGoogle(_ sender: Any) {
        performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
    
    @IBAction func buttonLoginTW(_ sender: Any) {
        performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue.destination as! PhotosCollectionViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

