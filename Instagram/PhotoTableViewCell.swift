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

    @IBOutlet var authorTimeLabel: UILabel!
    @IBOutlet var pictureImage: UIImageView!
    @IBOutlet var photoCaptionLabel: UILabel!
    var author: String?
    var time: String?
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
            let user = post["author"] as? PFObject
            
            user?.fetchInBackground(block: { (user: PFObject?, error: Error?) in
                let username = user?["username"] as? String
                self.authorTimeLabel.text = username
            })

            //author = post.value(forKey: "_p_author") as! String
//            time = post.value(forKey: "_created_at") as! String
//            authorTimeLabel.text = "\(author)  \(time)"
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
