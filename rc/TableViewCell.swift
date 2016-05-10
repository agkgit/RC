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
    
    //Buttons
    @IBOutlet weak var playButton:      UIButton!
    
    //Images
    @IBOutlet weak var flagImage:       UIImageView!
    @IBOutlet weak var statusImage:     UIImageView!
    @IBOutlet weak var likedImage:      UIImageView!
    @IBOutlet weak var commentImage:    UIImageView!
    @IBOutlet weak var scheduledImage:  UIImageView!
    
    //Labels
    @IBOutlet weak var visitorPhoneLabel:   UILabel!
    @IBOutlet weak var cityLabel:           UILabel!
    @IBOutlet weak var timeLabel:           UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func playButtonAction(sender: AnyObject) {

        if RCPlayer.player != nil { RCPlayer.player.stop() }
        
        let url: NSURL = NSBundle.mainBundle().URLForResource("sound", withExtension: "mp3")!
        do { RCPlayer.player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil) }
        catch let error as NSError { print(error.description) }
        
        
        //RCPlayer.player.numberOfLoops = 0
        //RCPlayer.player.prepareToPlay()
        RCPlayer.player.play()
    
//                let url = NSURL(string: "https://redhelper.ru/my/rc/calls/mp3/\(callID).mp3")
//                downloadFileFromURL(url)
    }
    
//        func downloadFileFromURL(url: NSURL){
//            var downloadTask:NSURLSessionDownloadTask
//            downloadTask = NSURLSession.sharedSession().downloadTaskWithURL(url, completionHandler: { (URL, response, error) -> Void in
//    
//                self.play(URL!)
//    
//            })
//    
//            downloadTask.resume()
//        }
    
//        func play(url:NSURL) {
//            print("playing \(url)")
//    
//            do {
//                RCPlayer.player = try AVAudioPlayer(contentsOfURL: url)
//                RCPlayer.player.prepareToPlay()
//                //player.volume = 1.0
//                RCPlayer.player.play()
//            } catch let error as NSError {
//                //self.player = nil
//                print(error.localizedDescription)
//            } catch {
//                print("AVAudioPlayer init failed")
//            }
//            
//        }
    
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
        } else {
            self.flagImage.alpha = 0.2
            self.flagImage.image = UIImage(named: "Unknown.png")
        }
        
        //fill statusImage
        if let status = self.redConnectCallData.status {
            
            switch status {
            case "normal":
                if self.redConnectCallData.free == false { self.statusImage.image = UIImage(named: "icon_call_success") }
                else { self.statusImage.image = UIImage(named: "icon_operator_done") }
                
            case "operator_unavailable":
                self.statusImage.image = UIImage(named: "icon_operator_false")
                //case "operator_hangup":
            //    cell.statusImage.image = UIImage(named: "icon_operator_done")
            default:
                self.statusImage.image = UIImage(named: "icon_call_failed")
            }
            
            //            if status == "normal" {
            //
            //            }
            
        } else {
            self.statusImage.alpha = 0.2
            self.statusImage.image = UIImage(named: "icon_call_nil") }
    
        //fill commentImage
        if let comment = self.redConnectCallData.feedbackComment {
            if comment != "" { self.commentImage.image = UIImage(named: "icon_comment") }
        } else {
            self.commentImage.alpha = 0.2
            self.commentImage.image = UIImage(named: "icon_comment_default")
        }
        
        //fill scheduledImage
        if let scheduled = self.redConnectCallData.scheduled {
            if scheduled {
                self.scheduledImage.image = UIImage(named: "icon_timecall_true")
            } else {
                self.scheduledImage.image = UIImage(named: "icon_timecall_false")
            }
        } else {
            self.scheduledImage.alpha = 0.2
            self.scheduledImage.image = UIImage(named: "icon_timecall_false")
        }
    }
    
    
}