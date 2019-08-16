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

        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        tableView.accessibilityIdentifier = "Home Table View"
        tableView.separatorStyle = .none
        
        navigationController?.navigationBar.barTintColor = UIColor(white: 0.95, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.black

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationItem.title = "Messages"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView.rowHeight = 70.0
        
        getUserInformation()
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(white: 0.95, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.black
        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell else {
            fatalError()
        }

        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.selectedBackgroundView = bgColorView
        
        cell.nameLabel.text = users[indexPath.row].contactName
        cell.lastMessageLabel.text = users[indexPath.row].textMessages[users[indexPath.row].textMessages.count-1].textMessages
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.moveToDetailedMessageView(message: users[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
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
