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
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif",
        "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional",
        "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg","posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg",  "wafflewolf.jpg", "fiveleaves.jpg","cafelore.jpg", "confessional.jpg", "barrafina.jpg",   "donostia.jpg",      "royaloak.jpg",  "thaicafe.jpg"]
    
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
    "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York",
    "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
     
    var isRestaurantVisited = [Bool](count: 21, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        return restaurantNames.count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
            NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.restaurantImage.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.accessoryType = isRestaurantVisited[indexPath.row] ? .Checkmark : .None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath
        indexPath: NSIndexPath)
    {
        
//CREATING AN ACTION MENU
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let visitedAction = UIAlertAction(title: "I've been here", style: UIAlertActionStyle.Default, handler: {
        (action:UIAlertAction!) -> Void in
// VERY IMPORTANT
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
// VERY IMPORTANT
            self.isRestaurantVisited[indexPath.row] = true
        })
        let callAction = UIAlertAction(title: "Call" + " 123-000-\(indexPath.row)", style: .Default, handler:
            {(action:UIAlertAction) -> Void in
            let callAlertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not yet available. Please try later", preferredStyle: .Alert)
            callAlertMessage.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(callAlertMessage, animated: true, completion: nil)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(visitedAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
