//
//  UsersTableViewCell.swift
//  Messages
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {

    let nameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.accessibilityIdentifier = "name"
        name.textAlignment = .left
        return name
    }()
    
    let lastMessageLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 18)
        name.accessibilityIdentifier = "last message"
        name.textAlignment = .left
        return name
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(white: 0.95, alpha: 1)
        accessibilityIdentifier = "Home Cell"
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(150)
            make.left.equalToSuperview().offset(20)
        }
        
        addSubview(lastMessageLabel)
        lastMessageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(2)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(300)
        }
    }

}
