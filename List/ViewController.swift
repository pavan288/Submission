//
//  ViewController.swift
//  List
//
//  Created by Pavan Powani on 15/10/16.
//  Copyright © 2016 Pavan Powani. All rights reserved.
//

import UIKit
import CoreData

class tableViewController: UITableViewController {
    
    var listItems = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(tableViewController.addItem))
    }
    
    func addItem(){
        
        let alertController = UIAlertController(title: "Type Something", message: "Type...", preferredStyle: UIAlertControllerStyle.Alert)
        let confirmAction = UIAlertAction(title: "Type Something!!!!!!!", style: UIAlertActionStyle.Default, handler: ({
            (_) in
            
            if let field = alertController.textFields![0] as? UITextField{
                
                self.saveItem(field.text!)
                self.tableView.reloadData()
                
            }
        }))
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addTextFieldWithConfigurationHandler( {
            (textField) in
            textField.placeholder = "Type something"
        })
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func saveItem(itemToSave:String){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("ListItems", inManagedObjectContext: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        do{
             try managedContext.save()
            listItems.append(item)
        }
        catch{
            print("error")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        
        return cell
    }
}

