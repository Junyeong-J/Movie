//
//  TextField+Extension.swift
//  Movie
//
//  Created by 전준영 on 6/6/24.
//

import UIKit

extension UITextField {
    
    func setUITextField(backgroundColor: UIColor, borderStyle: UITextField.BorderStyle, placeholder: String, tintColor: UIColor, textAlignment: NSTextAlignment) {
        self.backgroundColor = backgroundColor
        self.borderStyle = borderStyle
        self.placeholder = placeholder
        self.tintColor = tintColor
        self.textAlignment = textAlignment
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.textColor = .black
    }
    
}
