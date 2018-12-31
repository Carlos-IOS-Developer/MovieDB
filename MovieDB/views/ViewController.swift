//
//  ViewController.swift
//  MovieDB
//
//  Created by Carlos on 12/28/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
  
    
    //MARK: Properties
    @IBOutlet weak var TableView: UITableView!
    var timer = Timer()
    var times:Int = 0;

    override func viewDidAppear(_ animated: Bool) {
        TableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.delegate = self
        TableView.dataSource = self
        PopularModel.getPopular()
    }

    //MARK: Display Data
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        let popular = UserDefaults.standard.array(forKey: "popular") as? [[String:AnyObject]]
       
            if popular != nil{

                let popularList = popular![indexPath.row]
        let actorname = popularList["name"] as! String
            cell.actor.text = actorname
                timer.invalidate()
        }else{
            print("error")

                startTimer()
                
        }
        
        return cell
        
        }
        
    //MARK: Number Of Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let popular = UserDefaults.standard.array(forKey: "popular") as? [[String:AnyObject]]


        return popular?.count ?? 1
    }
    
    //MARK: Select Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
        let indexPath = TableView.indexPathForSelectedRow //optional, to get from any UIButton for example
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        
        let popular = UserDefaults.standard.array(forKey: "popular") as! [[String:AnyObject]]

        if popular != nil{

        let selected = popular[(indexPath!.row)]
        
        UserDefaults.standard.set(selected, forKey: "id")
        }else{
            print("error")
        }
        performSegue(withIdentifier: "Details", sender: cell)
        
    
    }
    //Mark: Data Reload
    func startTimer(){

        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds

            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.reload), userInfo: nil, repeats: false)
            
        
    }
    
    @objc func reload(){
        times += 1
        // call your function
        if times < 100 {  // set the next timer
            self.startTimer()
           TableView.reloadData()
        }}
    
    

}

