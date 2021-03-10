//
//  TableViewCell.swift
//  TestMarsSwinJectProject
//
//  Created by User on 06.03.2021.
//

import UIKit
import SDWebImage
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var langCordinate: UITextField!
    @IBOutlet weak var latCordinate: UITextField!
    
    static var reusableId = "Cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - tableView offset from the top cell
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 4
            super.frame = frame
        }
    }
    
    //MARK: -  Cell configure

    func cellConfigure(urlString: String){
        imageView?.sd_setImage(with: URL(string: urlString),
                          placeholderImage: #imageLiteral(resourceName: "noPhoto"),
                          options: [],
                          context: nil )
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    //MARK: -  Prepare for reuse
    
    override func prepareForReuse() {
        self.imageView?.image = nil
        super.prepareForReuse()
    }
}
