//
//  TableViewCell.swift
//  rc
//
//  Created by Arseniy Krupenin on 13.03.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit
import AVFoundation


class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var visitorPhone: UILabel!
    @IBOutlet weak var clientPhone: UILabel!
    @IBOutlet weak var arrow: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var likedImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    var player = AVAudioPlayer()

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func playButtonAction(sender: AnyObject) {

                let url:NSURL = NSBundle.mainBundle().URLForResource("sound", withExtension: "mp3")!
                do { player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil) }
                catch let error as NSError { print(error.description) }
                player.numberOfLoops = 1
                player.prepareToPlay()
                player.play()
    }
    

    
    

}
