//
//  HomeTableViewControllerTests.swift
//  MessagesTests
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import Messages

class HomeTableViewControllerTests: XCTestCase {

    var homeVC: HomeTableViewController!
    let utility = UtilityMethods()
    var mockNavController: MockNavigationController!
    var homeCoordinator: HomeCoordinator!
    
    override func setUp() {
        
        homeVC = HomeTableViewController()
        mockNavController = MockNavigationController()
        homeCoordinator = HomeCoordinator(navController: mockNavController)
        homeVC.delegate = homeCoordinator
        _ = homeVC.view
    }
    
    func test_WhenHomeTableViewController_ThenHomeTableViewCellIsPresent(){
        
        let rajivMessages1 = TextMessages(from: true, to: false, textMessages: "Hi, How are you ?", timeStamp: "Wed, 14 Aug 2019 06:26:19")
        let rajivMessages2 = TextMessages(from: false, to: true, textMessages: "Hi, I am fine", timeStamp: "Wed, 14 Aug 2019 07:26:19")
        let rajivMessages3 = TextMessages(from: false, to: true, textMessages: "How are you?", timeStamp: "Wed, 14 Aug 2019 07:27:19")
        
        let rajiv = MessageContacts(contactName: "Rajiv", textMessages: [rajivMessages1,rajivMessages2,rajivMessages3])
        
       homeVC.delegate?.moveToDetailedMessageView(message: rajiv)
        
        XCTAssert(self.mockNavController.topViewController?.isKind(of: DetailedConversationViewController.self) ?? false)
        
        
    }

}
