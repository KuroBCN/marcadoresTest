//
//  marcadoresUITests.swift
//  marcadoresUITests
//
//  Created by Pereiro, Delfin on 18/06/16.
//  Copyright © 2016 Pereiro, Delfin. All rights reserved.
//

import XCTest

class marcadoresUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMatchDetailHeader(){
        
        let app = XCUIApplication()
        XCTAssert(app.exists)
    
        let leagues = getLeagues()
        
        let name1 = "Manchester United"
        let name2 = "Arsenal"
        
        var selectedMatch : Match?
        for league in leagues{
            for match in league.matches {
                if match.homeTeam.name == name1 || match.visitorTeam.name == name1 ||
                    match.homeTeam.name == name2 || match.visitorTeam.name == name2 {
                    selectedMatch = match
                    print(match.homeTeam.name+"-"+match.visitorTeam.name)
                    break
                }
            }
        }

        if let selectedMatch = selectedMatch {
            app.tables.cells.containingType(.StaticText, identifier: selectedMatch.homeTeam.name).containingType(.StaticText, identifier: selectedMatch.visitorTeam.name).element.tap()

            let homeScore = app.tables.staticTexts.containingType(.StaticText, identifier: "homeScore").elementBoundByIndex(0)
            let visitorScore = app.tables.staticTexts.containingType(.StaticText, identifier: "visitorScore").elementBoundByIndex(0)
            
            XCTAssertEqual(homeScore.label, selectedMatch.homeTeam.result)
            XCTAssertEqual(visitorScore.label, selectedMatch.visitorTeam.result)
        }
    }
    
    func getLeagues()->[League]{
        
        var leagues = [League]()
        
        let campaignExpectation = expectationWithDescription("Leagues call")
        
        MatchDAO.getAllMatches { (matches) in
            leagues = matches
            campaignExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(20, handler: nil)
        
        return leagues
    }
}
