//
//  WaterTrackerListController.swift
//  WaterTracker
//
//  Created by Saad Faisal on 12/3/23.
//

import Foundation
import UIKit

class WaterTrackerListController : UITableViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        InitializeData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destController = segue.destination as! ViewController
        
        let index = tableView.indexPathForSelectedRow
        let selectedRowWT = WaterArray[index!.row]
        destController.SplitViewWT = selectedRowWT
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WaterArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var myCell = tableView.dequeueReusableCell(withIdentifier: "myCellID")
        
        var cellIndex = indexPath.row
        var WT = WaterArray[cellIndex]
        
        myCell!.textLabel!.text = WT.WaterName
        myCell!.detailTextLabel!.text = WT.WaterDescription
        return myCell!
    }
    
    var WaterArray = [WaterTracker()]
    
    func InitializeData() {
        var wa1 = WaterTracker()
        wa1.WaterName = "Consumption for Male"
        wa1.WaterDescription = "Among U.S. adults, men consumed an average of 3.46 liters (117 ounces) of water per day. Men aged 60 and over consumed less water (2.92 liters) than men aged 20–39 (3.61 liters) and 40–59 (3.63 liters)"
        
        wa1.WaterWebsite = "https://www.cdc.gov/nchs/products/databriefs/db242"
        WaterArray.append(wa1)
        
        var wa2 = WaterTracker()
        wa2.WaterName = "Consumption for Female"
        wa2.WaterDescription = "Among U.S. adults, women consumed 2.75 liters (93 ounces) per day. Women aged 60 and over consumed less water (2.51 liters) than women aged 20–39 (2.78 liters) and 40–59 (2.9 liters)."
        wa2.WaterWebsite = "https://www.cdc.gov/nchs/products/databriefs/db242"
        WaterArray.append(wa2)
        
    }
    
}
