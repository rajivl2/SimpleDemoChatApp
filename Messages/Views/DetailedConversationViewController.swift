//
//  DetailedConversationTableViewController.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class DetailedConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var messages: MessageContacts?
    private var myTableView: UITableView!
    
    private let typedMessage: UITextField = {
        let text = UITextField()
        text.placeholder = "Type your text here.. !!"
        text.backgroundColor = UIColor.clear
        text.tintColor = UIColor.white
        text.textColor = .black
        text.layer.cornerRadius = 2.0
        text.layer.borderWidth = 2.0
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.masksToBounds = true
        return text
    }()
    
    private let sendButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Send", for: .normal)
        btn.backgroundColor = UIColor(red: 100/255, green: 160/255, blue: 140/255, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 8.0
        return btn
    }()
    
    init(messageDetail: MessageContacts) {
        self.messages = messageDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        navigationController?.navigationBar.barTintColor = UIColor(white: 0.95, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.black
        
        self.navigationItem.title = messages?.contactName
        
        myTableView = UITableView()
        myTableView.register(DetailedConversationTableViewCell.self, forCellReuseIdentifier: "messageCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.accessibilityIdentifier = "Detailed Table View"
        
        //myTableView.rowHeight = 70.0
        myTableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        myTableView.separatorStyle = .none
        
        self.view.addSubview(myTableView)
        
        myTableView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
        
        self.view.addSubview(typedMessage)
        typedMessage.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(80)
            make.right.equalToSuperview().offset(-150)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        self.view.addSubview(sendButton)
        sendButton.snp.makeConstraints { (make) in
            make.top.equalTo(myTableView.snp.bottom).offset(20)
            make.left.equalTo(typedMessage.snp.right).offset(20)
        }
        
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    @objc func sendButtonTapped(){
        guard let newText = self.typedMessage.text else {
            return
        }
        if newText != "" {
            let newMessage = TextMessages(from: false, to: true, textMessages: newText, timeStamp: "now")
            self.messages?.textMessages.append(newMessage)
        }
        myTableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages?.textMessages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? DetailedConversationTableViewCell else {
            fatalError()
        }
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.selectedBackgroundView = bgColorView
        
        cell.chatMessage = messages?.textMessages[indexPath.row]
        
        return cell
    }
}
