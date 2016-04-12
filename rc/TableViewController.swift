//
//  TableViewController.swift
//  rc
//
//  Created by Arseniy Krupenin on 11.03.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit
import AVFoundation


class TableViewController: UITableViewController {
    
//    var calls = RCHistory.getHistory()   // let
//    var sectors = RCHistory.getSectors() // let
//    var callsDay = [[RedConnectCallData]]()
//    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        
        
        
        
        
        //        var headerView = UIView(frame: CGRectMake(0, 0, 20, 20))
        //        self.tableView.tableHeaderView = headerView
        
        
        
//        for i in 0 ..< sectors.count {
//            let m = [RedConnectCallData]()
//            callsDay.append(m)
//            for j in 0 ..< calls.count {
//                if calls[j].data == sectors[i] {
//                    callsDay[i].append(calls[j])
//                }
//            }
//        }
//        
        super.viewDidLoad()
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // MARK: - Table view data source
//    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        return RCHistory.getSectors()[section]
//        
//    }
//    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return RCHistory.getSectors().count
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        var number = 0
//        for call in calls { if call.data == sectors[section] { number += 1 } }
//        
//        return number
//    }
//    
//    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        let label = UILabel()
//        
//        label.frame = CGRect(x: 8, y: 0, width: 320, height: 40)
//        label.font = UIFont.boldSystemFontOfSize(12)
//        
//        label.text = sectors[section]
//        let headView = UIView()
//        headView.addSubview(label)
//        
//        return headView
//    }
//    
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
//        
//        let cellData = callsDay[indexPath.section][indexPath.row]
//        
//        cell.callID = cellData.id
//        
//        cell.time?.text = cellData.time
//        
//        if let visitorPhone = cellData.visitorPhone {
//            cell.visitorPhone.text = phoneNumberFormat(visitorPhone)
//        }
//        
//        if  let clientPhone = cellData.clientPhone {
//            cell.clientPhone.text = phoneNumberFormat(clientPhone)
//        }
//        
//        if let cityRu = cellData.cityRu {
//            cell.cityLabel?.text = cityRu
//        }
//        
//        cell.arrow?.text = "\u{2192}"
//        
//        //        if callsDay[indexPath.section][indexPath.row].liked == true { cell.likedImage?.image = UIImage(named: "liked_true.png") }
//        //        else if callsDay[indexPath.section][indexPath.row].liked == false { cell.likedImage?.image = UIImage(named: "liked_false.png") }
//        
//        
//        cell.statusImage?.image = UIImage(named: "status_normal.png")
//        cell.flagImage?.image = UIImage(named: "Russia.png")
//        
//        cell.playButton.setImage(UIImage(named: "play40.png"), forState: UIControlState.Normal)
//        cell.playButton.setImage(UIImage(named: "pause40.png"), forState: UIControlState.Highlighted)
//        
//        
//        return cell
//    }
//    
//    /*
//     // Override to support conditional editing of the table view.
//     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//     // Return false if you do not want the specified item to be editable.
//     return true
//     }
//     */
//    
//    
//    //    // Override to support editing the table view.
//    //    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//    //        if editingStyle == .Delete {
//    //            // Delete the row from the data source
//    //            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//    //        } else if editingStyle == .Insert {
//    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    //        }
//    //    }
//    
//    
//    
//    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
//        //Social
//        let infoAction = UITableViewRowAction(style: .Default, title: "ИНФО", handler: { (actin, indexPath) -> Void in
//            
//            print("Информация")
//            
//        })
//        
//        //Ban
//        let banAction = UITableViewRowAction(style: .Default, title: "БАН", handler: {(actin, indexPath) -> Void in
//            
//            print("Пользователь забанен")
//            
//        })
//        
//        infoAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
//        banAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
//        
//        return [banAction, infoAction]
//    }
//    
//    
//    
//    /*
//     // Override to support rearranging the table view.
//     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//     
//     }
//     */
//    
//    /*
//     // Override to support conditional rearranging of the table view.
//     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//     // Return false if you do not want the item to be re-orderable.
//     return true
//     }
//     */
//    
//    /*
//     // MARK: - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//     // Get the new view controller using segue.destinationViewController.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//    func phoneNumberFormat (number: String) -> String {
//        
//        var phone: String = "+"
//        var i = 0
//        let space: Character = " "
//        let bktOpen: Character = "("
//        let bktClose: Character = ")"
//        let dash: Character = "-"
//        
//        for char in number.characters {
//            phone.append(char)
//            if (i == 3) { phone.append(bktClose) }
//            if (i == 0) || (i == 3) { phone.append(space) }
//            if (i == 0) { phone.append(bktOpen) }
//            if (i == 6) || (i == 8) { phone.append(dash)}
//            i += 1
//        }
//        
//        return phone
//    }
    
    
}