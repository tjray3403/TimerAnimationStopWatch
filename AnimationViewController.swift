//
//  AnimationViewController.swift
//  tray_TimerStopWatchAnimation
//
//  Created by Tristan Earl Ray, Jr on 4/11/24.
//

import UIKit
import AVFoundation

class AnimationViewController: UIViewController {

    @IBOutlet weak var playpause: UIButton!
    @IBOutlet weak var myPicView: UIImageView!
    var myImgs : [UIImage] = [] //an array to hold all the images to be animated
    var songPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...6 {
            myImgs.append(UIImage(named: "jump\(i).png")!)
            
        }
        myPicView.animationImages = myImgs //tell the computer the array of images
        myPicView.animationDuration = 1.0 //play all the images withs 1.5s
        myPicView.image = myImgs[0]
        
        let song = Bundle.main.path(forResource: "jumpsound", ofType: "mp3")
        let url = URL(fileURLWithPath: song!)
        do {
            songPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
           
        }
    }
    

    @IBAction func PlayStopAtion(_ sender: Any) {
        if myPicView.isAnimating {
            myPicView.stopAnimating()
            myPicView.image = myImgs[0]
            playpause.setTitle("Play", for: .normal)
            songPlayer.stop()
        } else {
            playpause.setTitle("Stop", for: .normal)
            myPicView.startAnimating()
            songPlayer.play()
        }
    }

}
