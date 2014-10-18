//
//  ViewController.swift
//  BridgeObjcDemo
//
//  Created by Jerry Huang on 2014/10/18.
//  Copyright (c) 2014年 kerkerj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var isConnected = checkNetworkConnection()
        
        let alert = UIAlertView()
        alert.title = "Network Connection"
        
        if isConnected {
            alert.message = "You're online!"
        } else {
            alert.message = "You're offline!"
        }
        
        alert.addButtonWithTitle("OK")
        alert.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkNetworkConnection() -> Bool {
        let reachability: Reachability = Reachability.reachabilityForInternetConnection()
        let networkStatus: NetworkStatus = reachability.currentReachabilityStatus()
        
        println(networkStatus.toRaw())
        
        switch (networkStatus.toRaw()) {
        case 0:
            println("[Network Status]: NotReachable")
        case 1:
            println("[Network Status]: ReachableViaWWAN")
        case 2:
            println("[Network Status]: ReachableViaWiFi")
        default:
            break
        }
        
        return networkStatus.toRaw() != 0
    }
}

