//
//  TeamTests.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import XCTest

class TeamTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidMatch() {
        
        let teamData = ["id":8455,"name":"Chelsea","shortName":"Chelsea","logoUrl":"http://medias.whatsthescore.com/logos/icons/app-teams-large-ios-retina/8455.png"]
        
        let team = Team(teamData: teamData)
        XCTAssertNotNil(team)
        XCTAssertEqual(team?.id, teamData["id"])
        XCTAssertEqual(team?.name, teamData["name"])
        XCTAssertEqual(team?.shortName, teamData["shortName"])
        XCTAssertEqual(team?.logoUrl, teamData["logoUrl"])
        XCTAssertNil(team?.result)
    }
    
    func testInvalidId() {
        
        let teamData = ["id":"28455","name":"Chelsea","shortName":"Chelsea","logoUrl":"http://medias.whatsthescore.com/logos/icons/app-teams-large-ios-retina/8455.png"]
        
        let team = Team(teamData: teamData)
        XCTAssertNil(team)
    }
    
    func testNoId() {
        
        let teamData = ["name":"Chelsea","shortName":"Chelsea","logoUrl":"http://medias.whatsthescore.com/logos/icons/app-teams-large-ios-retina/8455.png"]
        
        let team = Team(teamData: teamData)
        XCTAssertNil(team)
    }
    
    func testNoName() {
        let teamData = ["id":28455,"shortName":"Chelsea","logoUrl":"http://medias.whatsthescore.com/logos/icons/app-teams-large-ios-retina/8455.png"]
        
        let team = Team(teamData: teamData)
        XCTAssertNil(team)
    }
    
    func testNoShorName() {
        let teamData = ["id":28455,"name":"Chelsea","logoUrl":"http://medias.whatsthescore.com/logos/icons/app-teams-large-ios-retina/8455.png"]
        
        let team = Team(teamData: teamData)
        XCTAssertNil(team)
    }
    
    func testNoLogoURL() {
        let teamData = ["id":8455,"name":"Chelsea","shortName":"Chelsea"]
        
        let team = Team(teamData: teamData)
        XCTAssertNil(team)
    }
    
    func testValidResults() {
        
        let results = ["runningscore":"0"]
        let teamData = ["id":8455,"name":"Chelsea","shortName":"Chelsea","logoUrl":"http://medias.whatsthescore.com/logos/icons/app-teams-large-ios-retina/8455.png","results":results] as [String:AnyObject]
        
        let team = Team(teamData: teamData)
        XCTAssertNotNil(team)
        XCTAssertEqual(team?.result, results["runningscore"])
    }
    
    func testInvalidResults() {
        
        let results = ["runningscore":0]
        let teamData = ["id":8455,"name":"Chelsea","shortName":"Chelsea","logoUrl":"http://medias.whatsthescore.com/logos/icons/app-teams-large-ios-retina/8455.png","results":results] as [String:AnyObject]
        
        let team = Team(teamData: teamData)
        XCTAssertNotNil(team)
        XCTAssertNil(team?.result)
    }

}
