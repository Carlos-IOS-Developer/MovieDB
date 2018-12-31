//
//  DetailsViewController.swift
//  MovieDB
//
//  Created by Carlos on 12/28/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    //MARK: Properties 
    @IBOutlet weak var nametxt: UILabel!
    @IBOutlet weak var birthdaytxt: UILabel!
    @IBOutlet weak var infotxt: UITextView!
    var times:Int = 0;
    var timer = Timer()
    override func viewDidAppear(_ animated: Bool) {
        start()
        displayInfo()
        startTimer()

    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        start()
        displayInfo()
        
        

    }
    // MARK : Display Details
    func displayInfo()  {
        
        let name = UserDefaults.standard.value(forKey: "name") as? String
        nametxt.text = name
        let birthday =  UserDefaults.standard.value(forKey: "birthday") as? String
        birthdaytxt.text = birthday
        let biography = UserDefaults.standard.value(forKey: "biography") as? String
        infotxt.text = biography
    }
    // MARK: Getting Data
    func start(){
        let artistdata = UserDefaults.standard.value(forKey: "id") as? [String:AnyObject]
        let id = artistdata!["id"] as! Int
        DetailsModel.getDetails(artistId: id)

    }

    // Mark: refresh Data
    func startTimer(){
        
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.reload), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func reload(){
        times += 1
        // call your function
        if times < 5 {  // set the next timer
            self.startTimer()
            start()
            displayInfo()
        }
        
    }

}
