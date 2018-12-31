//
//  BEServant.swift
//  Fit&Fix
//
// Created by Carlos on 12/28/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class BEServant: NSObject {
    

    // MARK: - Domain URL
    class  func DomainIpAddress()->NSString
    {
        var DomainStringToBeChangedLaterEquals=NSString()
        
        DomainStringToBeChangedLaterEquals = "https://api.themoviedb.org/3"
        
        let stringOfDomain=NSString(format: "%@", DomainStringToBeChangedLaterEquals)
        
        
        
        return stringOfDomain
    }
    
    // MARK: - Services URL
    class  func ServiceUrl()->NSString
    {
        let domainAdded=NSString(format: "%@/",self.DomainIpAddress()
            
        )
        return domainAdded
    }
  

    // MARK: - login&Register
    class func Popular()->String
    {
        let serviceName="person/popular?api_key=880524e6fe533cdb134a34d557f61b57"
        let urlString="\(ServiceUrl())\(serviceName)"
        
        return urlString
    }
    
    class func Details(ID:Int)->String
    {
        let serviceName = "person/\(ID)?api_key=880524e6fe533cdb134a34d557f61b57" as NSString
        let urlString="\(ServiceUrl())\(serviceName)"
        
        return urlString
    }
    
    class func Imgs(ID:Int)->String
    {
        let serviceName="person/\(ID)/images?api_key=880524e6fe533cdb134a34d557f61b57" as NSString
        let urlString="\(ServiceUrl())\(serviceName)"
        
        return urlString
    }
    
    class func Search(text:String)->String
    {
        let serviceName = "search/person?api_key=880524e6fe533cdb134a34d557f61b57" as NSString
        let urlString="\(ServiceUrl())\(serviceName)&query=\(text)"
        
        return urlString
    }
    
  }
