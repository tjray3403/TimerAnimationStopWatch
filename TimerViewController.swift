//
//  TimerViewController.swift
//  tray_TimerStopWatchAnimation
//
//  Created by Tristan Earl Ray, Jr on 4/11/24.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var myDateLabel: UILabel!
    @IBOutlet weak var myTimeLabel: UILabel!
    
    var myTimer = Timer() // install a timer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateT()
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateT), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateT() {
        //read date and time, display them on the screen
        let currentDate = NSDate() // read the latest date and time information
        
        let myDateFormatter = DateFormatter() //Date
        myDateFormatter.dateFormat = "MMMM dd, yyyy"
        let convertedDateStr = myDateFormatter.string(from: currentDate as Date)
        myDateLabel.text = convertedDateStr
        
        myDateFormatter.dateFormat = "hh:mm:ss"
        let convertedTimeStr = myDateFormatter.string(from: currentDate as Date)
        myTimeLabel.text = convertedTimeStr
        
    }

    

}
