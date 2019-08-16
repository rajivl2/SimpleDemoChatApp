//
//  DetailedConversationTableViewCellTests.swift
//  MessagesTests
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import Messages

class DetailedConversationTableViewCellTests: XCTestCase {
    
    var homeVC: DetailedConversationTableViewCell!
    let utility = UtilityMethods()
    
    override func setUp() {
        
        homeVC = DetailedConversationTableViewCell()
        
    }
    
    func test_WhenHomeTableViewController_ThenHomeTableViewCellIsPresent(){
        XCTAssertNotNil(utility.findUILabelWithAccessibilityIdentifierForView(view: homeVC, accIdentifier: "message"))
        
        XCTAssertNotNil(utility.findUILabelWithAccessibilityIdentifierForView(view: homeVC, accIdentifier: "time"))
        
        XCTAssertNotNil(utility.findUIViewWithAccessibilityIdentifierForView(view: homeVC, accIdentifier: "chatBox"))
    }
    
}
