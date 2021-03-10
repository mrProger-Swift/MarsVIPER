//
//  imageView.swift
//  TestMarsSwinJectProject
//
//  Created by User on 08.03.2021.
//

import UIKit
class imageView: UIImageView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config ()
    }
    
    convenience init(images: UIImage){
        self.init(frame: .zero)
       image = images
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config () {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
    }
}
