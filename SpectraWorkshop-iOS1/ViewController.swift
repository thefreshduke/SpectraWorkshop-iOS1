//
//  ViewController.swift
//  SpectraWorkshop-iOS1
//
//  Created by Scotty Shaw on 7/21/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func startTime(sender: AnyObject) {
        startButton.enabled = false
        startButton.hidden = true
        stopButton.enabled = true
        stopButton.hidden = false
        timeLabel.text = "STARTED"
    }
    
    @IBAction func stopTime(sender: AnyObject) {
        startButton.enabled = true
        startButton.hidden = false
        stopButton.enabled = false
        stopButton.hidden = true
        timeLabel.text = "STOPPED"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = "00:00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

