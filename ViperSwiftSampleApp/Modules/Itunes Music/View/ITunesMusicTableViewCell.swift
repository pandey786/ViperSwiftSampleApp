//
//  ITunesMusicTableViewCell.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 01/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import UIKit
import Kingfisher

class ITunesMusicTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewThumbNail: UIImageView!
    @IBOutlet weak var labelMusicTitle: UILabel!
    @IBOutlet weak var labelMusicArtist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(_ musicModel: ItunesMusicModel) {
        
        //Set Rounded Image View
        self.imageViewThumbNail.layer.cornerRadius = 30
        self.imageViewThumbNail.layer.masksToBounds = true
        
        //Set Data
        self.labelMusicTitle.text = musicModel.trackName
        self.labelMusicArtist.text = musicModel.artistName
        
        //Set Image
        if let imageUrl =  URL.init(string: musicModel.artworkUrl100!) {
            self.imageViewThumbNail.kf.setImage(with: imageUrl)
        }
        
    }
}
