//
//  UtilityMethods.swift
//  MessagesTests
//
//  Created by Ford Labs on 14/08/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import Foundation
import UIKit

class UtilityMethods{
    
    func findLabelsForView(view: UIView, labelText: String) -> UILabel?{
        for subview in view.subviews{
            if let label = subview as? UILabel, label.text == labelText {
                return label
            }
        }
        return nil
    }
    
    func findButtonsForView(view: UIView, buttonTittle: String) -> UIButton?{
        for subview in view.subviews{
            if let button = subview as? UIButton, button.currentTitle == buttonTittle {
                return button
            }
        }
        return nil
    }
    
    func findTextFieldsForView(view: UIView, placeholder: String) -> UITextField?{
        for subview in view.subviews{
            if let textField = subview as? UITextField, textField.placeholder == placeholder {
                return textField
            }
        }
        return nil
    }
    
    func findUILabelWithAccessibilityIdentifierForView(view: UIView, accIdentifier: String) -> UILabel?{
        for subview in view.subviews{
            if let label = subview as? UILabel, label.accessibilityIdentifier == accIdentifier {
                return label
            }
        }
        return nil
    }
    
    func findUITextViewWithAccessibilityIdentifierForView(view: UIView, accIdentifier: String) -> UITextView?{
        for subview in view.subviews{
            if let text = subview as? UITextView, text.accessibilityIdentifier == accIdentifier {
                return text
            }
        }
        return nil
    }

    func findTableViewWithAccessibilityIdentifierForView(view: UIView, accIdentifier: String) -> UITableView?{
        for subview in view.subviews{
            if let text = subview as? UITableView, text.accessibilityIdentifier == accIdentifier {
                return text
            }
        }
        return nil
    }
    
    func findTableViewCellWithAccessibilityIdentifierForView(view: UIView, accIdentifier: String) -> UITableViewCell?{
        for subview in view.subviews{
            if let text = subview as? UITableViewCell, text.accessibilityIdentifier == accIdentifier {
                return text
            }
        }
        return nil
    }
    
    func findUIViewWithAccessibilityIdentifierForView(view: UIView, accIdentifier: String) -> UIView?{
        for subview in view.subviews{
            if subview.accessibilityIdentifier == accIdentifier {
                return view
            }
        }
        return nil
    }
}
