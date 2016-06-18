//
//  MatchDAO.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import Foundation
import Alamofire

class MatchDAO: NSObject {

    class func getAllMatches(result : ( matches : [League] )->()) {
        getMatches(nil, result: result)
    }
    
    class func getAllLiveMatches(result : ( matches : [League] )->()) {
        getMatches("status=live", result: result)
    }
    
    class func getAllFinishedMatches(result : ( matches : [League] )->()) {
    
        getMatches("status=finished", result: result)
    }
    
    // MARK: - Private methods
    private class func getMatches( query : String?, result : ( matches : [League] )->()){
        
        var url = "http://api.whatsthescore.com/api/test/match"
        if let query = query {
            url = url + "?" + query
        }
        
        Alamofire.request(.GET, url, parameters: nil)
            .responseJSON { response in
                
                // load from file
                //                let leaguesData = Helpers.loadJSONFile("datos").0
                
                var leagues = [League]()
                if let leaguesData = response.result.value as? [AnyObject]{
                    // Parse leagues
                    for leagueData in leaguesData {
                        if let league = League(leagueData: leagueData as? [String : AnyObject]){
                            leagues.append(league)
                        }
                    }
                }
                result(matches: leagues)
        }
    }
}
