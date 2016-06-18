//
//  League.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import Foundation

class League: NSObject {

    let id : String
    let name : String
    let matches : [Match]
    
    init(id:String, name : String, matches:[Match]) {
        self.id = id
        self.name = name
        self.matches = matches
    }
    
    convenience init?( leagueData : [String:AnyObject]?) {
        
        var matches = [Match]()
        if let matchesData = leagueData?["matches"] as? [[String:AnyObject]]{
            for matchData in matchesData {
                if let match =  Match(matchData: matchData){
                    matches.append(match)
                }
            }
        }
        
        if let
            id = leagueData?["relatedToObjectId"] as? String,
            name = leagueData?["name"] as? String {
            self.init(id: id,name: name,matches: matches)
        }else{
            return nil
        }
    }
}
