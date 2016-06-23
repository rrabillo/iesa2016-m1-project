//
//  ListIntervenantViewController.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import UIKit

class ListIntervenantViewController: UITableViewController {
    
        var detailViewController: DetailViewController? = nil
        var objects = NSMutableArray()
        var myIntervenant = IntervenantList()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            self.navigationItem.leftBarButtonItem = self.editButtonItem()
            
            let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
            self.navigationItem.rightBarButtonItem = addButton
            if let split = self.splitViewController {
                let controllers = split.viewControllers
                self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            }
        }
        
        override func viewWillAppear(animated: Bool) {
            self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
            super.viewWillAppear(animated)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        /*func insertNewObject(sender: AnyObject) {
            myIntervenant.books.insert(myIntervenant.books[0], atIndex: 0)
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }*/
        
        // MARK: - Segues
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "showDetail" {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let selectedIntervant:Intervenant = myIntervenant.intervenantCollection[indexPath.row]
                    let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                    controller.detailItem = selectedIntervant
                    controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    controller.navigationItem.leftItemsSupplementBackButton = true
                }
            }
        }
        
        // MARK: - Table View
        
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myIntervenant.intervenantCollection.count
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            cell.textLabel!.text = myIntervenant.intervenantCollection[indexPath.row].name
            return cell
        }
        
        override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        
        override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle == .Delete {
                myIntervenant.intervenantCollection.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            } else if editingStyle == .Insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
        }
    
    
    
}