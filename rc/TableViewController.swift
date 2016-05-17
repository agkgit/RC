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
    
    
    var sectors = [String]()
    var callsHistory = [[RedConnectCallData]]()
    var player = AVAudioPlayer()
    
//////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        (sectors, callsHistory) = RCHistory.getCallsHistoryWithSectors()
        super.viewDidLoad()
    }
    
//////////////////////////////////////////////////////////////////////////////////////////////////////

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
//////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectors[section]
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return callsHistory.count
    }
    
//////////////////////////////////////////////////////////////////////////////////////////////////////

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return callsHistory[section].count
    }
    
//////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        
        label.frame = CGRect(x: 8, y: 0, width: 320, height: 40)
        label.font = UIFont.boldSystemFontOfSize(14)
        
        label.text = sectors[section]
        
        let headView = UIView()
        headView.addSubview(label)
        headView.alpha = 0.8
        headView.backgroundColor = UIColor.whiteColor()
        return headView
    }
    
    //заполнение
    
//////////////////////////////////////////////////////////////////////////////////////////////////////

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.fill(callsHistory[indexPath.section][indexPath.row])
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    //    // Override to support editing the table view.
    //    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //        if editingStyle == .Delete {
    //            // Delete the row from the data source
    //            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    //        } else if editingStyle == .Insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //        }
    //    }
    
    
//////////////////////////////////////////////////////////////////////////////////////////////////////

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //Social
        let infoAction = UITableViewRowAction(style: .Default, title: "ИНФО", handler: { (actin, indexPath) -> Void in
            
            print("Информация")
            
        })
        
        //Ban
        let banAction = UITableViewRowAction(style: .Default, title: "БАН", handler: {(actin, indexPath) -> Void in
            
            print("Пользователь забанен")
            
        })
        
        infoAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        banAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [banAction, infoAction]
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
    
    
    @IBAction func segueSignOutAction(sender: AnyObject) {
        
        self.performSegueWithIdentifier("segueSignOut", sender: nil)
        
    }
}