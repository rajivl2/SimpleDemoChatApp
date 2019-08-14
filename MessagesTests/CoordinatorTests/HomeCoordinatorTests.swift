//
//  HomeCoordinatorTests.swift
//  MessagesTests
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import XCTest
@testable import Messages

class HomeCoordinatorTests: XCTestCase {

    var homeCoordinator: HomeCoordinator!
    var mockNavigationcontroller: MockNavigationController!
    
    override func setUp() {
        mockNavigationcontroller = MockNavigationController()
        homeCoordinator = HomeCoordinator(navController: mockNavigationcontroller)
    }

    func testExample() {
        homeCoordinator.start()
        
        XCTAssert(self.mockNavigationcontroller.topViewController?.isKind(of: HomeTableViewController.self) ?? false)
    }


}
