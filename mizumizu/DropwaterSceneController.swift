//
//  DropWaterSceneController.swift
//  mizumizu
//
//  Created by ryosuke_miyake on 2018/08/03.
//  Copyright © 2018年 ryosuke_miyake. All rights reserved.
//

import Foundation

//
//  ViewController.swift
//  mizumizu
//
//  Created by ryosuke_miyake on 2018/08/02.
//  Copyright © 2018年 ryosuke_miyake. All rights reserved.
//

import UIKit
import UserNotifications

class DropwaterSceneController: UIViewController {
    @IBAction func water(_ sender: Any) {
        
    }
    func action(_ sender: Any)
    {
        let content =UNMutableNotificationContent()
        content.title = "Your plant will dry up soon!"
        content.subtitle = ""
        content.body = "Please drink water and water your plant."
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        let request = UNNotificationRequest(identifier: "tunerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler:  nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge],
                                                                completionHandler: {didAllow, error in
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


