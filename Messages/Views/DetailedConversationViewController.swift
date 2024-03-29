//
//  DetailedConversationTableViewController.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit
import os.log

class DetailedConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var messages: MessageContacts?
    private var myTableView: UITableView!
    
    let viewModel = MessageViewModel()
    
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
        btn.backgroundColor = .clear
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
        
        self.view.addSubview(sendButton)
        sendButton.snp.makeConstraints { (make) in
            make.top.equalTo(myTableView.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        self.view.addSubview(typedMessage)
        typedMessage.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.right.equalTo(sendButton.snp.left).offset(-20)
            make.width.equalTo(300)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        addDoneButtonOnKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    @objc func sendButtonTapped(){
        guard let newText = self.typedMessage.text else {
            return
        }
        if newText != "" {
            let nowTimeStamp = self.getCurrentTimeStampWithDesiredFormat()
            let newMessage = TextMessages(from: false, to: true, textMessages: newText, timeOfTextMessage: nowTimeStamp)
            self.messages?.textMessages.append(newMessage)
            viewModel.saveMessages(messages: self.messages!)
        }
        
        typedMessage.text = ""
        
        myTableView.reloadData()
    }
    
    func getCurrentTimeStampWithDesiredFormat() -> String {
        let now = Date()
        
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        
        formatter.dateFormat = "MMM d, h:mm:ss a"
        formatter.locale = Locale(identifier: "en_US")
        
        let dateString = formatter.string(from: now)
        return dateString
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
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        typedMessage.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        typedMessage.resignFirstResponder()
    }
    
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if typedMessage.isFirstResponder {
                self.view.frame.origin.y = -keyboardSize.height
            }
        }
    }
}
