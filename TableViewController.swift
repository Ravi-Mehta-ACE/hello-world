//
//  TableViewController.swift
//  HelloWorld
//
//  Created by Puneet Rao on 19/05/16.
//  Copyright © 2016 Geeks. All rights reserved.
//

import UIKit


class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif",
//        "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional",
//        "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
//    
//    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg","posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg",  "wafflewolf.jpg", "fiveleaves.jpg","cafelore.jpg", "confessional.jpg", "barrafina.jpg",   "donostia.jpg",      "royaloak.jpg",  "thaicafe.jpg"]
//    
//    
//    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
//    "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York",
//    "London", "London", "London", "London"]
//    
//    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
//     
//    var isRestaurantVisited = [Bool](count: 21, repeatedValue: false)
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image:"homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image:"teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location:"Hong Kong", image: "cafeloisl.jpg",isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited:false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location:"Sydney", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image: "thaicafe.jpg", isVisited: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            self.title = "Food Pin"
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
            
            
    }
    
    override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.hidesBarsOnSwipe = true
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int
    {
        // Return the number of rows in the section.
        return restaurants.count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
            NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.restaurantImage.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark : .None
        return cell
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath
//        indexPath: NSIndexPath)
//    {
//        
//        //CREATING AN ACTION MENU
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
//        let visitedAction = UIAlertAction(title: "I've been here", style: UIAlertActionStyle.Default, handler: {
//        (action:UIAlertAction!) -> Void in
//        // VERY IMPORTANT
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        // VERY IMPORTANT
//            self.isRestaurantVisited[indexPath.row] = true
//        })
//        let callAction = UIAlertAction(title: "Call" + " 123-000-\(indexPath.row)", style: .Default, handler:
//            {(action:UIAlertAction) -> Void in
//            let callAlertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not yet available. Please try later", preferredStyle: .Alert)
//            callAlertMessage.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
//            self.presentViewController(callAlertMessage, animated: true, completion: nil)
//        })
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        optionMenu.addAction(visitedAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(cancelAction)
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//    }
    
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            restaurants.removeAtIndex(indexPath.row)
//            restaurants.removeAtIndex(indexPath.row)
//            restaurants.removeAtIndex(indexPath.row)
//            restaurants.removeAtIndex(indexPath.row)
//            restaurants.removeAtIndex(indexPath.row)
        }
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    // Share Button Action
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {
            (action, indexPath) -> Void in
                let defaultText = "Just checked in at " + self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image){
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
        })
    // Delete Button Action
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: {
            (action, indexPath) -> Void in
            // Delete the row from the data source
            self.restaurants.removeAtIndex(indexPath.row)
//            restaurants.removeAtIndex(indexPath.row)
//            restaurants.removeAtIndex(indexPath.row)
//            restaurants.removeAtIndex(indexPath.row)
//            restaurants.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:
                .Fade)
        })
        shareAction.backgroundColor = UIColor(red: 65.0/255.0, green: 131.0/255.0, blue: 215.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showRestaurantDetail")
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                let destinationController = segue.destinationViewController as! TableDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    
    }


}
