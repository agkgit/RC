//
//  TableViewController.swift
//  rc
//
//  Created by Arseniy Krupenin on 11.03.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var calls = RCHistory.getHistory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return calls.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        cell.time?.text = calls[indexPath.row].time
        cell.visitorPhone?.text = phoneNumberFormat(calls[indexPath.row].visitorPhone)
        cell.clientPhone?.text = phoneNumberFormat(calls[indexPath.row].clientPhone)
        cell.arrow?.text = "\u{2192}"
        cell.statusImage?.image = UIImage(named: "status_normal.png")
        cell.flagImage?.image = UIImage(named: "Russia.png")
        cell.cityLabel?.text = calls[indexPath.row].city
        
        if calls[indexPath.row].liked == true { cell.likedImage?.image = UIImage(named: "liked_true.png") }
        else if calls[indexPath.row].liked == false { cell.likedImage?.image = UIImage(named: "liked_false.png") }
        
        if calls[indexPath.row].free == true { cell.freeImage?.image = UIImage(named: "rc_free.png") }
        else if calls[indexPath.row].free == false { cell.freeImage?.image = UIImage(named: "rc_business.png") }
        
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
