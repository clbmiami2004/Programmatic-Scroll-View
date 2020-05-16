//
//  PaddedTextField.swift
//  Programmatic Scrol View
//
//  Created by Christian Lorenzo on 5/15/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

import UIKit


class PaddedTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 4
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented = create it programmatically")
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
    
}
