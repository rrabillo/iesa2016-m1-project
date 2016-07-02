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
        var objects = [AnyObject]()
        var intervenantContainer = IntervenantList(coder:NSCoder())
        
        
        override func viewDidLoad() {
            self.intervenantContainer.retrieveItems()
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
        let alert = UIAlertController(title: "Inserer un intervenant", message: "Veuillez saisir les informations requises", preferredStyle: UIAlertControllerStyle.Alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default){
            
            (action: UIAlertAction) -> Void in
            let nameField = alert.textFields![0] as UITextField
            let prenomField = alert.textFields![1] as UITextField
            let ageField = alert.textFields![2] as UITextField
            let sexeField = alert.textFields![3] as UITextField
            let countryField = alert.textFields![4] as UITextField
            let intervenant = Intervenant(nameValue:nameField.text!, firstNameValue: prenomField.text!, countryValue: countryField.text!, ageValue: ageField.text!, photoValue: "no", sexeValue: sexeField.text!)
            self.intervenantContainer.intervenantCollection.append(intervenant)
            self.intervenantContainer.insertItems()
            self.intervenantContainer.retrieveItems()
            self.tableView.reloadData()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){
            (action: UIAlertAction) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
            textField.placeholder = "Nom"
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
            textField.placeholder = "Prénom"
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
            textField.placeholder = "Age"
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
            textField.placeholder = "Sexe"
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
            textField.placeholder = "Pays"
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion:nil)
    }


        // MARK: - Segues
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "showDetail" {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let selectedIntervant:Intervenant = self.intervenantContainer.intervenantCollection[indexPath.row]
                    let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                    print(selectedIntervant.name)
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
            return self.intervenantContainer.intervenantCollection.count
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            cell.textLabel!.text = self.intervenantContainer.intervenantCollection[indexPath.row].name
            return cell
        }
        
        override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        
        override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle == .Delete {
                self.intervenantContainer.intervenantCollection.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            } else if editingStyle == .Insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
        }
    
    
    
}