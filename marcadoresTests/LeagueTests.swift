//
//  LeagueTests.swift
//  marcadores
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import XCTest

class LeagueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidLeague() {
        let leagueData = ["relatedToObjectId":"47","name":"Premier League","matches":[]]
        let league = League(leagueData: leagueData)
        XCTAssertNotNil(league)
        XCTAssertEqual(league?.id, leagueData["relatedToObjectId"])
        XCTAssertEqual(league?.name, leagueData["name"])
    }

    func testNoMatches() {
        let leagueData = ["relatedToObjectId":"47","name":"Premier League"]
        XCTAssertNotNil( League(leagueData: leagueData))
    }

    func testInvalidId() {
        let leagueData = ["relatedToObjectId":47,"name":"Premier League","matches":[]]
        XCTAssertNil( League(leagueData: leagueData))
    }

    func testNoId() {
        let leagueData = ["name":"Premier League","matches":[]]
        XCTAssertNil( League(leagueData: leagueData))
    }

    func testNoName() {
        let leagueData = ["relatedToObjectId":"47","matches":[]]
        XCTAssertNil( League(leagueData: leagueData))
    }

}
