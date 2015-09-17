//
//  ShowRecordTVC.swift
//  Sign Collector
//
//  Created by User on 15.09.15.
//  Copyright (c) 2015 CodeSWAT. All rights reserved.
//

import UIKit

class ShowRecordTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All records for Form1"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return Int(1)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let inputData1 = defaults.objectForKey("Form1") as? NSArray {
            return inputData1.count
        }
        else {
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FormCell", forIndexPath: indexPath) as! UITableViewCell
        
        var recordWrapper: [RecordViewCellControllerTableViewCell]
        
        var userName: [String] = []
        var imagesDraw: [String] = []
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let inputData1 = defaults.objectForKey("Form1") as? NSArray {
            var inputData1 = defaults.objectForKey("Form1") as! Array<Dictionary<String, AnyObject>>
            
            for index in 0...inputData1.count {
                //userName.append(inputData1[index]["lName"])
                //imagesDraw.append(inputData1[index]["signature"])
            }
        }

        let row = indexPath.row
        //cell.imageView?.image = UIImage(named: imagesDraw[row])
        //cell.textLabel?.text = recordWrapper[row].firstName
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
