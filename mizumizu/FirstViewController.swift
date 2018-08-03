//
//  Created by ryosuke_miyake on 2018/08/03.
//  Copyright © 2018年 ryosuke_miyake. All rights reserved.
//

import UIKit
import UserNotifications

class FirstViewController: UIViewController {
    
    @IBOutlet weak var state: UILabel!
    
    
    
    func action()
    {
        let content = UNMutableNotificationContent()
        content.title = "Your plant will dry up soon!"
        content.subtitle = ""
        content.body = "Please drink water and water your plant."
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        let request = UNNotificationRequest(identifier: "tunerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler:  nil)
    }
    
    @IBOutlet weak var drinkWaterButton: UIButton!
    
    @IBOutlet weak var plantImage: UIImageView!
    
    @IBAction func drinkButtonClicked(_ sender: UIButton) {
        drinkWaterButton.setImage(UIImage(named:"map2-2.png"), for: .normal)
        plantImage.image = UIImage(named:"plant_01")
        
        state.text = "Your plant is healthy!"
        state.textColor = UIColor.blue
        
        var myVar = GlobalVar.shared
        myVar.userDefaults.set(Date().timeIntervalSince1970, forKey: "interval")
        action()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        state.textColor = UIColor.red
    }
    
    @objc func onDidBecomeActive(_ notification: Notification?) {
        var myVar = GlobalVar.shared
        let interval = Date().timeIntervalSince1970 - myVar.userDefaults.double(forKey: "interval")
        let roundedInterval = round(interval * 10) / 10
        
        if roundedInterval >= 15{
            state.text = "Your plant will dry up soon!"
            state.textColor = UIColor.red
            drinkWaterButton.setImage(UIImage(named:"map2-3.png"), for: .normal)
            plantImage.image = UIImage(named:"plant-3")
        }
        else if roundedInterval >= 7{
            state.text = "Water your plant!"
            state.textColor = UIColor(red: 0.9765, green: 0.749, blue: 0, alpha: 1.0)
            drinkWaterButton.setImage(UIImage(named:"map2-4.png"), for: .normal)
            plantImage.image = UIImage(named:"plant-2")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(FirstViewController.onDidBecomeActive(_:)),
            name: NSNotification.Name.UIApplicationDidBecomeActive,
            object: nil
        )
        var myVar = GlobalVar.shared
        myVar.userDefaults.register(defaults: myVar.dict)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

