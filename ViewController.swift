//
//  ViewController.swift
//  WaterTracker
//
//  Created by Saad Faisal on 10/15/23.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var lblWaterConsumption: UILabel!
    
    
    @IBOutlet weak var txtWaterDescription: UITextView!
    
    var SplitViewWT:WaterTracker = WaterTracker()
    
    //var WaterArray = ["Cup of Water", "Bottle of Water"]
    var WaterArray = [WaterTracker()]
    var mySound: AVAudioPlayer!
        
    @IBAction func btnWebSite(_ sender: Any) {
        var browserApp = UIApplication.shared
        var url = URL(string: "https://www.cdc.gov/nchs/products/databriefs/db242")
        browserApp.open(url!)
    }
    
    @IBAction func btnAddWater(_ sender: Any) {
        setLabels()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWaterConsumption.text = "Water Added"
        InitializeData()
        let soundUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "target_hit", ofType: "wav")!)
        mySound = try? AVAudioPlayer(contentsOf: soundUrl)
        setLabels()
    }
    
    func setLabels(){
        var randomWater = SplitViewWT
        lblWaterConsumption.text = randomWater.WaterName
        txtWaterDescription.text = randomWater.WaterDescription
        imgWaterImage.image = UIImage(named:"backgroundwater.jpeg")
        imgWaterImage.layer.cornerRadius = 25
        imgWaterImage.contentMode = .scaleAspectFill
        
        txtWaterDescription.layer.cornerRadius = 15
        txtWaterDescription.layer.borderColor = UIColor.darkGray.cgColor
        
        mySound.play()
        
    }
    
    @IBOutlet weak var imgWaterImage: UIImageView!
    
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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        imgWaterImage.alpha = 0;
        lblWaterConsumption.alpha = 0
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 3, animations: {
            self.imgWaterImage.alpha = 1
            self.lblWaterConsumption.alpha = 1
        })
    }
    

    

}

