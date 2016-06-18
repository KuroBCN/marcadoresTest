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
        
        Alamofire.request(.GET, "http://api.whatsthescore.com/api/test/match/", parameters: nil)
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
    
    
    //    func getAllLiveMatches() -> List<Match> {}
    //    func getAllFinishedMatches() -> List<Match> {}
    
}
