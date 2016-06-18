//
//  Match.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import Foundation

class Match: NSObject {
    
    let id : NSInteger
    let tournamentId : NSInteger
    let name : String
    let statusShortDesc : String
    let homeTeam : Team
    let visitorTeam : Team
    
    init (id : NSInteger,
          tournamentId : NSInteger,
          name : String,
          statusShortDesc : String,
          homeTeam :Team,
          visitorTeam: Team){
        self.id = id
        self.tournamentId = tournamentId
        self.name = name
        self.statusShortDesc = statusShortDesc
        self.homeTeam = homeTeam
        self.visitorTeam = visitorTeam
    }
    
    convenience init? (matchData : [String:AnyObject]?) {
        
        let teamsArray = matchData?["teams"] as? [[String:AnyObject]]
        
        if let
            id = matchData?["id"] as? NSInteger,
            tournamentId = matchData?["tournamentId"] as? NSInteger,
            name = matchData?["name"] as? String,
            statusShortDesc = matchData?["statusShortDesc"] as? String,
            homeTeam = Team(teamData: teamsArray?[0]),
            visitorTeam = Team(teamData: teamsArray?[1]){
            
            self.init(id: id, tournamentId: tournamentId, name: name, statusShortDesc: statusShortDesc, homeTeam: homeTeam,visitorTeam: visitorTeam)
        } else {
            return nil
        }
    }

}
