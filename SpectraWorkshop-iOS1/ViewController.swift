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
        updateButtonSettings()
        validateTimer()
    }
    
    @IBAction func stopTime(sender: AnyObject) {
        updateButtonSettings()
        timer.invalidate()
        counter = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = "00:00:00"
        
        startButton.enabled = true
        startButton.hidden = false
        stopButton.enabled = false
        stopButton.hidden = true
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
        var remainingCounter = counter
        
        // calculate elapsed minutes
        let minutes = remainingCounter / 6000
        remainingCounter -= minutes * 6000
        
        // calculate elapsed seconds
        let seconds = remainingCounter / 100
        remainingCounter -= seconds * 100
        
        // calculate elasped milliseconds
        let milliseconds = remainingCounter
        
        // add the leading zero for minutes, seconds and milliseconds and store them as string constants
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        // concatenate minutes, seconds and milliseconds and assign them to the UILabel
        timeLabel.text = "\(strMinutes):\(strSeconds):\(strMilliseconds)"
    }
    
    func updateButtonSettings() {
        startButton.enabled = !startButton.enabled
        startButton.hidden = !startButton.hidden
        stopButton.enabled = !stopButton.enabled
        stopButton.hidden = !stopButton.hidden
    }
}

