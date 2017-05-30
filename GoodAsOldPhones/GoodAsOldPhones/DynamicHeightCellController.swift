//
//  DynamicHeightCellController.swift
//  GoodAsOldPhones
//
//  Created by MengDan Zhu on 30/05/2017.
//  Copyright © 2017 Staydan.com. All rights reserved.
//

import UIKit

class DynamicHeightCellController: UITableViewController {
  
  
  let list: [String] = [
    "Ten horses:  horse horse horse horse horse horse horse horse horse horse ",
    "Three cows:  cow, cow, cow",
    "One camel:  camel",
    "Ninety-nine sheep:  sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep baaaa sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep sheep",
    "Thirty goats:  goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat goat "
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.estimatedRowHeight = 44.0
    tableView.rowHeight = UITableViewAutomaticDimension
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return self.list.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell:DynamicTableCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DynamicTableCellTableViewCell

    // Configure the cell...
    cell.dynamicTableCellLabel.text = self.list[indexPath.row]
    return cell
  }
}
