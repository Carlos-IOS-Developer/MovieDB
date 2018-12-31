//
//  ViewControllerModel.swift
//  MovieDB
//
//  Created by Carlos on 12/28/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PopularModel: NSObject {
    
    //MARK: get list of popular artists
   class func getPopular(){

        let urlString = BEServant.Popular()
        Alamofire.request(urlString).responseJSON { response in
            // Handling response
            if response.result.value != nil {
            let result = JSON(response.result.value!)
            if let resData = result["results"].arrayObject {
                let arrRes = resData as! [[String:AnyObject]]
                UserDefaults.standard.set(arrRes, forKey: "popular")}}else{
                print("failed")
               
            }
    }}}





