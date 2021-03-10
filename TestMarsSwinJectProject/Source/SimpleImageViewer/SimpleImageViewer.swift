//
//  SimpleImageViewer.swift
//  TestMarsSwinJectProject
//
//  Created by User on 09.03.2021.
//

import UIKit
import SimpleImageViewer
class SimpleImageViewer{
    func showImage(cell: UITableViewCell) -> ImageViewerController{
        let images = cell.imageView
        let conf = ImageViewerConfiguration { (image) in
            image.image = images?.image}
        let imageVC = ImageViewerController(configuration: conf)
        return imageVC
    }
}
