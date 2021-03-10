//
//  Button.swift
//  TestMarsSwinJectProject
//
//  Created by User on 08.03.2021.
//

import UIKit
class Button: UIButton{

        override init(frame: CGRect) {
            super.init(frame: frame)
            config ()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        convenience init(background: UIColor, title: String){
            self.init(frame: .zero)
            backgroundColor = background
            setTitle(title, for: .normal)
            
        }

        func config () {
            translatesAutoresizingMaskIntoConstraints = false
            layer.cornerRadius = 10
            
        }
}
