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
    
    var redConnectCallData: RedConnectCallData!
    
    // MARK: - Properties -
    
    // MARK: Buttons
    @IBOutlet weak var playButton:      UIButton!
    
    // MARK: Images
    @IBOutlet weak var flagImage:       UIImageView!
    @IBOutlet weak var statusImage:     UIImageView!
    @IBOutlet weak var likedImage:      UIImageView!
    @IBOutlet weak var commentImage:    UIImageView!
    @IBOutlet weak var scheduledImage:  UIImageView!
    
    // MARK: Labels
    @IBOutlet weak var visitorPhoneLabel:   UILabel!
    @IBOutlet weak var cityLabel:           UILabel!
    @IBOutlet weak var timeLabel:           UILabel!
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) { super.setSelected(selected, animated: animated) }
    
    @IBAction func playButtonAction(sender: AnyObject) {
        
        if let fileURL = self.redConnectCallData.filename {
            let url = NSURL(string: fileURL)
            let playerItem: AVPlayerItem! = AVPlayerItem(URL: url!)
            RCPlayer.player = AVPlayer(playerItem: playerItem)
            
            if RCPlayer.player.rate == 0 {
            }
            
            playButton.setImage(UIImage(named: "Pause60"), forState: UIControlState.Normal)
            RCPlayer.player.play()
        }
    }
    
    // MARK: fill cell action
    
    internal func fill(cellData: RedConnectCallData) {
        
        self.redConnectCallData = cellData
        
        //fill timeLabel
        if let time = self.redConnectCallData.time {
            self.timeLabel?.text = RCDataFormat.timeFormat(time)
        } else {
            self.timeLabel?.text = "--:--"
        }
        
        //fill visitorPhoneLabel
        if let visitorPhone = self.redConnectCallData.visitorPhone {
            self.visitorPhoneLabel.text = RCDataFormat.phoneNumberFormat(visitorPhone)
        } else {
            self.visitorPhoneLabel.text = "Номер неопределен"
        }
    
        //fill cityLabel
        if let cityRu = self.redConnectCallData.cityRu {
            
            if cityRu != "" { self.cityLabel?.text = cityRu }
        
        } else { self.cityLabel?.text = "Неизвестно" }
        
        //fill flagImage
        if let imageNamed = self.redConnectCallData.country {
            let named = RCDataFormat.replaceChar(imageNamed, replace: " ", replaced: "-") + ".png"
            self.flagImage.image = UIImage(named: named)
            self.flagImage.alpha = 1
        } else {
            self.flagImage.alpha = 0.5
            self.flagImage.image = UIImage(named: "Unknown.png")
        }
        
        //fill statusImage
        if let status = self.redConnectCallData.status {
            
            switch status {
            case "normal":
                if self.redConnectCallData.free == false { self.statusImage.image = UIImage(named: "icon_call_success") }
                else { self.statusImage.image = UIImage(named: "icon_operator_done") }
                
            case "operator_unavailable":
                self.statusImage.alpha = 1
                self.statusImage.image = UIImage(named: "icon_operator_false")
            default:
                self.statusImage.alpha = 1
                self.statusImage.image = UIImage(named: "icon_call_failed")
            }
            
        } else {
            self.statusImage.alpha = 0.5
            self.statusImage.image = UIImage(named: "icon_call_nil") }
    
        //fill commentImage
        if let comment = self.redConnectCallData.feedbackComment {
            if comment != "" {
                self.commentImage.alpha = 1
                self.commentImage.image = UIImage(named: "icon_comment")
            }
        } else {
            self.commentImage.alpha = 0.5
            self.commentImage.image = UIImage(named: "icon_comment_default")
        }
        
        //fill scheduledImage
        if let scheduled = self.redConnectCallData.scheduled {
            if scheduled {
                self.scheduledImage.alpha = 1
                self.scheduledImage.image = UIImage(named: "icon_timecall_true")
            } else {
                self.scheduledImage.alpha = 1
                self.scheduledImage.image = UIImage(named: "icon_timecall_false")
            }
        } else {
            self.scheduledImage.alpha = 0.5
            self.scheduledImage.image = UIImage(named: "icon_timecall_false")
        }
    }
    
    
}