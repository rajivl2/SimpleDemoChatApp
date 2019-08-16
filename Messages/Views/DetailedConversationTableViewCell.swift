//
//  DetailedConversationTableViewCell.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class DetailedConversationTableViewCell: UITableViewCell {
    
    var chatMessage: TextMessages!{
        didSet{
            bubbleBackgroundView.backgroundColor = chatMessage.from ? .green : .white
            message.text = chatMessage.textMessages
            time.text = chatMessage.timeStamp
            message.numberOfLines = 0
            message.textAlignment = chatMessage.from ? .left : .right
            time.textAlignment = chatMessage.from ? .left : .right
            
            if chatMessage.from {
                message.snp.makeConstraints { (make) in
                    make.left.equalToSuperview().offset(32)
                }
            } else {
                message.snp.makeConstraints { (make) in
                    make.right.equalToSuperview().offset(-32)
                }
            }
        }
    }
    
    let bubbleBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 8.0
        view.accessibilityIdentifier = "chatBox"
        return view
    }()
    
    let message: UILabel = {
        let name = UILabel()
        name.font = UIFont.boldSystemFont(ofSize: 15)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        name.accessibilityIdentifier = "message"
        return name
    }()
    
    let time: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 10)
        name.accessibilityIdentifier = "time"
        name.textAlignment = .right
        return name
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear

        setUpViews()
        bubbleBackgroundView.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        addSubview(bubbleBackgroundView)
        addSubview(message)
        message.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(32)
            make.bottom.equalToSuperview().offset(-32)
            make.width.lessThanOrEqualTo(250)
        }
        
        bubbleBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(message.snp.top).offset(-16)
            make.left.equalTo(message.snp.left).offset(-16)
            make.bottom.equalTo(message.snp.bottom).offset(16)
            make.right.equalTo(message.snp.right).offset(16)
        }
        
        addSubview(time)
        time.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-15)
        }
    }
}
