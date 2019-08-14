//
//  HomeCoordinator.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator{
    
    var navigationController: UINavigationController!
    var homeVC: HomeTableViewController!
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start(){
        homeVC = HomeTableViewController()
        homeVC.delegate = self
        self.navigationController.pushViewController(homeVC, animated: true)
    }
}

extension HomeCoordinator: HomeTableViewControllerDelegate{
    func moveToDetailedMessageView(message: MessageContacts) {
        let detailVC = DetailedConversationViewController(messageDetail: message)
        self.navigationController.pushViewController(detailVC, animated: true)
    }
    
    
}
