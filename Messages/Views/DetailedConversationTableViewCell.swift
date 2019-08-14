//
//  DetailedConversationTableViewCell.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class DetailedConversationTableViewCell: UITableViewCell {

    var from: Bool = false
    
    let message: UILabel = {
        let name = UILabel()
        name.font = UIFont.boldSystemFont(ofSize: 15)
        name.textAlignment = .left
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 140/255, green: 160/255, blue: 140/255, alpha: 1)
        setUpViews()
        //populateMessages()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        addSubview(message)
        message.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            //make.width.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-10)
        }
        
        addSubview(time)
        time.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    func populateMessages(){
        if self.from {
            message.textAlignment = .left
        } else {
            message.textAlignment = .right
        }
    }

}
