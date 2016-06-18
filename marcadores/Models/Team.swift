//
//  Team.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import UIKit

class Team: NSObject {
    
    let id : NSInteger
    let logoUrl : String
    let name : String
    let shortName : String
    var result : String?
    
    init( id : NSInteger, logoUrl : String, name:String, shortName :String, result :String? ) {
        self.id = id
        self.logoUrl = logoUrl
        self.name = name
        self.shortName = shortName
        self.result = result
        super.init()
    }
    
    convenience init?(teamData : [String:AnyObject]?){
        
        var matchResult : String? = nil
        if let resultData = teamData?["results"]?["runningscore"] as? String {
            matchResult = resultData
        }
        
        if let
            id  = teamData?["id"] as? NSInteger,
            name = teamData?["name"] as? String,
            shortName = teamData?["shortName"] as? String,
            logoUrl = teamData?["logoUrl"] as? String {
            
            self.init(id: id,logoUrl: logoUrl,name: name,shortName: shortName, result: matchResult)
        }else {
            return nil
        }
    }
}
