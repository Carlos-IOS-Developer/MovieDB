//
//  DeatilsViewControllerModel.swift
//  MovieDB
//
//  Created by Carlos on 12/28/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailsModel: NSObject {

    //MARK: get selected artist details
    class func getDetails(artistId: Int){
        let urlString = BEServant.Details(ID: artistId)
        Alamofire.request(urlString).responseJSON { response in // method defaults to `.get`
          
            // Handling response
            let result = JSON(response.result.value!)
            let name = result["name"].string
            let biography = result["biography"].string
            let birthday = result["birthday"].string
            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(biography, forKey: "biography")
            UserDefaults.standard.set(birthday, forKey: "birthday")
            
            }
        }
    
    
    



}
