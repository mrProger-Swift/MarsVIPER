//
//  MainModuleViewController.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 08/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import UIKit

final class MainModuleViewController: UIViewController, MainModuleViewProtocol {
    
    // MARK: - Public Properties
    
    var presenter: MainModulePresenterFromViewProtocol!
    var marsPhotoButton = Button(background: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), title: L10n.mPhotos)
    var earthPhotosButton = Button(background: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), title: L10n.ePhotos)
    var image = imageView(images: UIImage(named: "nasa")!)
    var marsImage = imageView(images: UIImage(named: "mars")!)
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marsPhotoButton.addTarget(self, action: #selector(marsButtonPress(sender:)), for: .touchUpInside)
        earthPhotosButton.addTarget(self, action: #selector(earthButtonPress(sender:)), for: .touchUpInside)
        presenter.viewDidLoad()
        view.addSubview(marsPhotoButton)
        view.addSubview(earthPhotosButton)
        view.addSubview(image)
        view.addSubview(marsImage)
        constarints()
    }

    // MARK: - Interface
    @objc func marsButtonPress(sender: UIButton){
        Coordinator.shared.display(confViews: marsConfigurator())
    }
    
    @objc func earthButtonPress(sender: UIButton){
            Coordinator.shared.display(confViews: EarthConfigurator())
    }
    
    func constarints() {
        NSLayoutConstraint.activate([marsPhotoButton.heightAnchor.constraint(equalToConstant: 50),
                                     marsPhotoButton.widthAnchor.constraint(equalToConstant: 290),
                                     marsPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     marsPhotoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     
                                     earthPhotosButton.heightAnchor.constraint(equalToConstant: 50),
                                     earthPhotosButton.widthAnchor.constraint(equalToConstant: 290),
                                     earthPhotosButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     earthPhotosButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -55),
                                     
                                     image.heightAnchor.constraint(equalToConstant: 100),
                                     image.widthAnchor.constraint(equalToConstant: 290),
                                     image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250),
                                     
                                     marsImage.heightAnchor.constraint(equalToConstant: 240),
                                     marsImage.widthAnchor.constraint(equalToConstant: 290),
                                     marsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     marsImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250)
        ])
    }
}
