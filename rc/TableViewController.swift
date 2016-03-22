//
//  TableViewController.swift
//  rc
//
//  Created by Arseniy Krupenin on 11.03.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var calls = RCHistory.getHistory()   // let
    var sectors = RCHistory.getSectors() // let
    var callsDay = [[RedConnectCallInfo]]()

    
    override func viewDidLoad() {
        
        
//        var headerView = UIView(frame: CGRectMake(0, 0, 20, 20))
//        self.tableView.tableHeaderView = headerView
        
        
        
        for i in 0 ..< sectors.count {
            let m = [RedConnectCallInfo]()
            callsDay.append(m)
            for j in 0 ..< calls.count {
                if calls[j].data == sectors[i] {
                    callsDay[i].append(calls[j])
                }
            }
        }
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return RCHistory.getSectors()[section]
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return RCHistory.getSectors().count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        var number = 0
        for call in calls { if call.data == sectors[section] { number += 1 } }
        
        return number
    }


    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        
        label.frame = CGRect(x: 8, y: 0, width: 320, height: 40)
        label.font = UIFont.boldSystemFontOfSize(12)
        
        label.text = sectors[section]
        let headView = UIView()
        headView.addSubview(label)
        
        return headView
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.playButton.setImage(UIImage(named: "play40.png"), forState: UIControlState.Normal)
        cell.playButton.setImage(UIImage(named: "pause40.png"), forState: UIControlState.Highlighted)
        
        cell.time?.text = callsDay[indexPath.section][indexPath.row].time
        cell.visitorPhone?.text = phoneNumberFormat(callsDay[indexPath.section][indexPath.row].visitorPhone)
        cell.clientPhone?.text = phoneNumberFormat(callsDay[indexPath.section][indexPath.row].clientPhone)
        cell.arrow?.text = "\u{2192}"
        cell.statusImage?.image = UIImage(named: "status_normal.png")
        cell.flagImage?.image = UIImage(named: "Russia.png")
        cell.cityLabel?.text = callsDay[indexPath.section][indexPath.row].cityRu
        
        if callsDay[indexPath.section][indexPath.row].liked == true { cell.likedImage?.image = UIImage(named: "liked_true.png") }
        else if callsDay[indexPath.section][indexPath.row].liked == false { cell.likedImage?.image = UIImage(named: "liked_false.png") }
        
        if callsDay[indexPath.section][indexPath.row].free == true { cell.freeImage?.image = UIImage(named: "rc_free.png") }
        else if callsDay[indexPath.section][indexPath.row].free == false { cell.freeImage?.image = UIImage(named: "rc_business.png") }
        
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func phoneNumberFormat (number: String) -> String {
        
        var phone: String = "+"
        var i = 0
        let space: Character = " "
        
        for char in number.characters {
            phone.append(char)
            if (i == 0) || (i == 3) || (i == 6) || (i == 8) { phone.append(space) }
            i += 1
        }
        
        return phone
    }


}