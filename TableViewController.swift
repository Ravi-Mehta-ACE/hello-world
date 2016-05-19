//
//  TableViewController.swift
//  HelloWorld
//
//  Created by Puneet Rao on 19/05/16.
//  Copyright © 2016 Geeks. All rights reserved.
//

import UIKit


class TableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif",
        "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional",
        "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg","posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg",  "wafflewolf.jpg", "fiveleaves.jpg","cafelore.jpg", "confessional.jpg", "barrafina.jpg",   "donostia.jpg",      "royaloak.jpg",  "thaicafe.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        // Return the number of rows in the section.
        return restaurantNames.count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
            NSIndexPath) -> UITableViewCell {
            let cellIdentifier = "Cell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
            // Configure the cell...
            cell.nameLabel.text = restaurantNames[indexPath.row]
            cell.restaurantImage.image = UIImage(named: restaurantImages[indexPath.row]);

            return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath
        indexPath: NSIndexPath) {
        
        
    // ALERT MENU APPEARING ON CELL CLICK
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want,to do?", preferredStyle: .ActionSheet)
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:
        nil)
        
    // HANDLER OBJECT
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message:
            "Sorry, the call feature is not available yet. Please retry later.",
            preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler:
            nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
    // CALL ACTION INITIALIZATION
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)",
                style: UIAlertActionStyle.Default, handler: callActionHandler)
        
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default,
            handler: {
                (action:UIAlertAction!) -> Void in
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell?.accessoryType = .Checkmark
            })
        
        
    // ADDING ACTIONS TO THE ALERTCONTROLLER
        
        optionMenu.addAction(isVisitedAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        
    // PRESENTING THE ALERT
        
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
