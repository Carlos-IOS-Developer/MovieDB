//
//  SearchViewControllerModel.swift
//  MovieDB
//
//  Created by Carlos on 12/28/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchModel: NSObject {


    //MARK: get search data
      class  func getSearch(searchtext:String) {

        let urlString = BEServant.Search(text: searchtext)
        Alamofire.request(urlString).responseJSON { response in
              if((response.result.value != nil)){// method defaults to `.get
            // Handling response
            if response.result.value != nil {
            let result = JSON(response.result.value!)
                if let resData = result["results"].arrayObject {
                     let arrRes = resData as! [[String:AnyObject]]
                    UserDefaults.standard.set(arrRes, forKey: "search")}
                    
                }else{
                    print("failed")
                }
        }}}
    
    }
    


          

    
        
    
    

