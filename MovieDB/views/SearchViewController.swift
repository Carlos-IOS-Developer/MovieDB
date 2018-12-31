//
//  SearchViewController.swift
//  MovieDB
//
//  Created by Carlos on 12/28/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var Searchtxt: UITextField!

    var timer = Timer()
    var times:Int = 0;

    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    //Mark: Search
    @IBAction func Searchbtn(_ sender: Any) {
        let searchItem = Searchtxt.text
        let searchString=NSString(format: "%@", searchItem ?? "")

        TableView.delegate = self
        TableView.dataSource = self
        SearchModel.getSearch(searchtext: searchString as String)
        TableView.reloadData()

    }
    //Mark: Load data
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        
        let searchname = UserDefaults.standard.array(forKey: "search") as? [[String:AnyObject]]

        if searchname != nil{

        let searchList = searchname![indexPath.row]
            let actorname = searchList["name"] as! String
            cell.actor.text = actorname


            timer.invalidate()
        }else{

            startTimer()

        }
        return cell
        
    }
    // Mark: Table Cell Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let searchdata = UserDefaults.standard.array(forKey: "search") as? [[String:AnyObject]]

        // this will provide infinite scrolling as long as the data are available 
        return searchdata?.count ?? 1
    }
    // Mark: Cell select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
        let indexPath = TableView.indexPathForSelectedRow //optional, to get from any UIButton for example
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        
        let searchdata = UserDefaults.standard.array(forKey: "search") as? [[String:AnyObject]]
        if searchdata != nil{

        let selected = searchdata![(indexPath!.row)]
        
        UserDefaults.standard.set(selected, forKey: "id")
        }else{
            print("error")
        }
        performSegue(withIdentifier: "SearchDetails", sender: cell)
        
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
