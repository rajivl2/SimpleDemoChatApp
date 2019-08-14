//
//  HomeTableViewController.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    private var users: [MessageContacts] = []
    
    weak var delegate: HomeTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 140/255, green: 160/255, blue: 140/255, alpha: 1)
        
        tableView.accessibilityIdentifier = "Home Table View"
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 140/255, green: 160/255, blue: 140/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.black
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationItem.title = "Messages"
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView.rowHeight = 70.0
        
        getUserInformation()
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(red: 140/255, green: 160/255, blue: 140/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.black
        self.view.backgroundColor = UIColor(red: 140/255, green: 160/255, blue: 140/255, alpha: 1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell else {
            fatalError()
        }

        cell.nameLabel.text = users[indexPath.row].contactName
        //cell.lastMessageLabel.text = users[indexPath.row].textMessages.toMessages[users[indexPath.row].textMessages.toMessages.count-1]
        cell.lastMessageLabel.text = users[indexPath.row].textMessages[users[indexPath.row].textMessages.count-1].textMessages
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.moveToDetailedMessageView(message: users[indexPath.row])
    }
    
    func sortTextMessages(){
        
    }

    func getUserInformation(){
        
        let messageViewModel = MessageViewModel()
        self.users = messageViewModel.getMessagedetails()
        
    }
    
}

protocol HomeTableViewControllerDelegate: class {
    func moveToDetailedMessageView(message: MessageContacts)
}
