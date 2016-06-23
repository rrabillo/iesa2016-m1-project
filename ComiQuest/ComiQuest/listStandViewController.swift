//
//  listStandViewController.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import Foundation

//
//  ListIntervenantViewController.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import UIKit

class listStandViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    var standContainer = StandList(coder:NSCoder())
  
    
    override func viewDidLoad() {
        self.standContainer.retrieveItems()
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
    
    func insertNewObject(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Inserer Stand", message: "Veuillez saisir les informations requises", preferredStyle: UIAlertControllerStyle.Alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default){
            (action: UIAlertAction) -> Void in
            let nameField = alert.textFields![0] as UITextField
            let nameField2 = alert.textFields![1] as UITextField
            let stand = Stand(name:nameField.text!, theme: nameField2.text!)
            self.standContainer.standCollection.append(stand)
            self.standContainer.insertItems()
            self.standContainer.retrieveItems()
            self.tableView.reloadData()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){
            (action: UIAlertAction) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
            textField.placeholder = "Nom du stand"
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
            textField.placeholder = "Theme du stand"
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion:nil)
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //                let selectedStand:Stand = standContainer.standCollection[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                // controller.detailItem = selectedStand
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
        //        standContainer.loadStands()
        return self.standContainer.standCollection.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.text = self.standContainer.standCollection[indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //standContainer.standCollection.removeAtIndex(indexPath.row)
            self.standContainer.removeItem(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
}

