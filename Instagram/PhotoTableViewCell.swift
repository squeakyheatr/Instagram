//
//  PhotoTableViewCell.swift
//  Instagram
//
//  Created by Robert Mitchell on 3/9/17.
//  Copyright © 2017 Robert Mitchell. All rights reserved.
//

import UIKit
import Parse

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet var pictureImage: UIImageView!
    @IBOutlet var photoCaptionLabel: UILabel!
    var post: PFObject! {
        didSet{
            if let postImageFile = post.value(forKey: "media") as? PFFile {
                postImageFile.getDataInBackground(block: { (image: Data?, error: Error?) in
                    if error == nil {
                        self.pictureImage.image = UIImage.init(data: image!)
                    }
                })
            }
            photoCaptionLabel.text = post.value(forKey: "caption") as? String
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
