//
//  MatchTests.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import XCTest

class MatchTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidMatch() {
        
        let matchData = ["id":1989061,"tournamentId":47,"name":"Chelsea - Tottenham","statusShortDesc":"FT","teams":getTeamsMock()] as [String:AnyObject]
        
        let match = Match(matchData: matchData)
        
        XCTAssertNotNil(match)
        XCTAssertEqual(match?.id, matchData["id"] as? NSInteger)
        XCTAssertEqual(match?.tournamentId, matchData["tournamentId"] as? NSInteger)
        XCTAssertEqual(match?.name, matchData["name"] as? String)
        XCTAssertEqual(match?.statusShortDesc, matchData["statusShortDesc"] as? String)
        XCTAssertNotNil(match?.homeTeam)
        XCTAssertNotNil(match?.visitorTeam)
    }
    
    func testInvalidId() {
        
        let matchData = ["id":"1989061","tournamentId":47,"name":"Chelsea - Tottenham","statusShortDesc":"FT","teams":getTeamsMock()] as [String:AnyObject]
        XCTAssertNil(Match(matchData: matchData))
    }
    
    func testNoId() {
        let matchData = ["tournamentId":47,"name":"Chelsea - Tottenham","statusShortDesc":"FT","teams":getTeamsMock()] as [String:AnyObject]
        
        XCTAssertNil(Match(matchData: matchData))
    }
    
    func testNoTournamentId() {
        let matchData = ["id":1989061,"name":"Chelsea - Tottenham","statusShortDesc":"FT","teams":getTeamsMock()] as [String:AnyObject]
        
        XCTAssertNil(Match(matchData: matchData))
    }
    
    func testNoName() {
        let matchData = ["id":1989061,"tournamentId":47,"statusShortDesc":"FT","teams":getTeamsMock()] as [String:AnyObject]
        
        XCTAssertNil(Match(matchData: matchData))
    }

    func testNoShortDescription() {
        let matchData = ["id":1989061,"tournamentId":47,"name":"Chelsea - Tottenham","teams":getTeamsMock()] as [String:AnyObject]
        
        XCTAssertNil(Match(matchData: matchData))
    }

    func testNoTeams() {
        let matchData = ["id":1989061,"tournamentId":47,"name":"Chelsea - Tottenham","statusShortDesc":"FT","teams":[]] as [String:AnyObject]
        
        XCTAssertNil(Match(matchData: matchData))
    }

    // MARK: - Private methods
    private func getTeamsMock()->[[String:AnyObject]]{
        let team1Data = ["id":8455,"name":"Chelsea","shortName":"Chelsea","logoUrl":"http://medias.whatsthescore.com/logos/icons/app-teams-large-ios-retina/8455.png"]
        
        let team2Data = ["id":8455,"name":"Chelsea","shortName":"Chelsea","logoUrl":"http://medias.whatsthescore.com/logos/icons/app-teams-large-ios-retina/8455.png"]
        
        return [team1Data,team2Data]
    }
}
