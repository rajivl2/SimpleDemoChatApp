//
//  DetailedConversationTableViewControllerTests.swift
//  MessagesTests
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import Messages

class HomeTableViewCellTests: XCTestCase {

    var homeVC: HomeTableViewCell!
    let utility = UtilityMethods()
    
    override func setUp() {
        
        homeVC = HomeTableViewCell()

    }
    
    func test_WhenHomeTableViewController_ThenHomeTableViewCellIsPresent(){
        XCTAssertNotNil(utility.findUILabelWithAccessibilityIdentifierForView(view: homeVC, accIdentifier: "name"))
        
        XCTAssertNotNil(utility.findUILabelWithAccessibilityIdentifierForView(view: homeVC, accIdentifier: "last message"))
    }

}
