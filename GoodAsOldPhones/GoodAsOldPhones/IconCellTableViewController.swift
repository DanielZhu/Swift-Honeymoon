//
//  IconCellTableViewController.swift
//  GoodAsOldPhones
//
//  Created by MengDan Zhu on 30/05/2017.
//  Copyright © 2017 Staydan.com. All rights reserved.
//

import UIKit

class IconCellTableViewController: UITableViewController {

    let catCount = 5
  
    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.catCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell:MyBasicCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyBasicCell

      // Configure the cell...
      cell.cellLabel.text = "cat No.\(indexPath.row + 1)"
      cell.cellLeftImage.image = UIImage(named: "cat\(indexPath.row + 1)")
      
      return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
