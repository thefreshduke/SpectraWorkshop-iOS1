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
    
    var counter: Int = 0
    var timer = NSTimer()
    
    @IBAction func startTime(sender: AnyObject) {
        startButton.enabled = false
        startButton.hidden = true
        stopButton.enabled = true
        stopButton.hidden = false
        
        validateTimer()
    }
    
    @IBAction func stopTime(sender: AnyObject) {
        startButton.enabled = true
        startButton.hidden = false
        stopButton.enabled = false
        stopButton.hidden = true
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
    
    func validateTimer() {
        let repeatingFunction: Selector = #selector(ViewController.updateTime)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: repeatingFunction, userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        counter += 1
        timeLabel.text = "\(counter)"
    }
}

