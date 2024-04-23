//
//  StopWatchViewController.swift
//  tray_TimerStopWatchAnimation
//
//  Created by Tristan Earl Ray, Jr on 4/11/24.
//

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startStopLabel: UIButton!
    
    var myTimer = Timer() //install our timer
    var startTime :TimeInterval?// = TimeInterval()
    var isRunning = false
    var rep : Bool = false
    var pausedTime: TimeInterval?
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTimer()
        //timeLabel.text = "00:00:00"
        //isRunning = false
    }
    
    func resetTimer() {
            timeLabel.text = "00:00:00"
            isRunning = false
            myTimer.invalidate() // Stop the timer if it's running
            startTime = nil // Reset startTime
            pausedTime = nil
            startStopLabel.setTitle("Start", for: .normal)
        }

    
    @IBAction func startStop(_ sender: Any) {
        if isRunning { // Currently, the clock is running. Need to stop
                myTimer.invalidate() // Stop the timer
                startStopLabel.setTitle("Start", for: .normal)
                pausedTime = Date.timeIntervalSinceReferenceDate // Capture the time when the timer is paused
            } else { // Currently, the clock is not running. Need to start
                startStopLabel.setTitle("Pause", for: .normal)
                if let startTime = startTime { // If startTime is already set
                    if let pausedTime = pausedTime { // If the timer was paused
                        let timeElapsedDuringPause = Date.timeIntervalSinceReferenceDate - pausedTime
                        self.startTime! += timeElapsedDuringPause // Adjust startTime by adding the time elapsed during the pause
                        self.pausedTime = nil // Reset pausedTime after adjusting startTime
                    }
                } else {
                    startTime = Date.timeIntervalSinceReferenceDate // Otherwise, set startTime
                }
                myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateT), userInfo: nil, repeats: true)
            }
            isRunning.toggle() // Toggle the running state
    }
    
    
    
    @IBAction func resetBtn(_ sender: Any) {
        resetTimer()
        
        //timeLabel.text = "00:00:00"
       // startStopLabel.setTitle("Pause", for: .normal)
        //startTime = NSDate.timeIntervalSinceReferenceDate
       // myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateT), userInfo: nil, repeats: true)
            
            
        
        
        
    }
    
    @objc func updateT() {
        guard let startTime = startTime else {
                    return // If startTime is nil, exit the function
                }
                
                var currentTime: TimeInterval
                
                if let pausedTime = pausedTime {
                    currentTime = Date.timeIntervalSinceReferenceDate - (pausedTime - startTime)
                } else {
                    currentTime = Date.timeIntervalSinceReferenceDate
                }
                
                // Calculate the elapsed time
                var elapsedTime = currentTime - startTime
                
                // Calculate minutes, seconds, and milliseconds
                let minutes = UInt8(elapsedTime / 60.0)
                elapsedTime -= TimeInterval(minutes) * 60
                let seconds = UInt8(elapsedTime)
                elapsedTime -= TimeInterval(seconds)
                let milliseconds = UInt8(elapsedTime * 100)
                
                // Display formatted time
                let strMinutes = String(format: "%02d", minutes)
                let strSeconds = String(format: "%02d", seconds)
                let strMilliseconds = String(format: "%02d", milliseconds)
                
                timeLabel.text = "\(strMinutes):\(strSeconds):\(strMilliseconds)"
            
    }

}
