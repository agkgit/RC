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
    
    var callID: Int!
    
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
    
        func downloadFileFromURL(url:NSURL){
            var downloadTask:NSURLSessionDownloadTask
            downloadTask = NSURLSession.sharedSession().downloadTaskWithURL(url, completionHandler: { (URL, response, error) -> Void in
    
                self.play(URL!)
    
            })
    
            downloadTask.resume()
    
        }
    
        func play(url:NSURL) {
            print("playing \(url)")
    
            do {
                RCPlayer.player = try AVAudioPlayer(contentsOfURL: url)
                RCPlayer.player.prepareToPlay()
                //player.volume = 1.0
                RCPlayer.player.play()
            } catch let error as NSError {
                //self.player = nil
                print(error.localizedDescription)
            } catch {
                print("AVAudioPlayer init failed")
            }
            
        }
    
}
