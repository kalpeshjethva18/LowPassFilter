//
//  ViewController.swift
//  LowPassFilter
//
//  Created by macpc on 05/04/16.
//  Copyright (c) 2016 macpc. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager = CMMotionManager()
    
    @IBOutlet var lblstepcounter: UILabel!
    
    var counter = NSInteger()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager.deviceMotionUpdateInterval = 0.1
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler:{
            deviceManager, error in
            
            var accelerationThreshold:Double = 1;
            var userAcceleration:CMAcceleration = deviceManager.userAcceleration;
            if(fabs(userAcceleration.x) > accelerationThreshold) || (fabs(userAcceleration.y) > accelerationThreshold) || (fabs(userAcceleration.z) > accelerationThreshold)
            {
                println("LowPassFilterSignal")
                self.counter++
                self.lblstepcounter.text = String(self.counter)
            }
        })

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ResetCounter(sender: UIButton) {
        
        counter = 0;
        self.lblstepcounter.text = "0"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

