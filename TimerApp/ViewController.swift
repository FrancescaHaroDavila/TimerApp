//
//  ViewController.swift
//  TimerApp
//
//  Created by Francesca Valeria Haro Dávila on 12/26/18.
//  Copyright © 2018 Belatrix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var stopButton: UIButton!
  @IBOutlet weak var pauseButton: UIButton!
  @IBOutlet weak var startButton: UIButton!
  
  var stopWatchTimer = Timer()
  var currentTime = 1
  var hoursCount = 0
  var minutesCount = 0
  var secondsCount = 0
  
  @IBAction func hasStartButtonPressed(_ sender: Any) {
    startButton.isHidden = true
    stopButton.isEnabled = true
    pauseButton.isHidden = false
    
    stopWatchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTime)), userInfo: nil, repeats: true)
    
  }
  
  @IBAction func hasStopButtonPressed(_ sender: Any) {
    stopButton.isEnabled = false
    pauseButton.isHidden = true
    startButton.isHidden = false
    
    timeLabel.text = "00:00:00"
    currentTime = 0
 
    stopWatchTimer.invalidate()
  }
  
  @IBAction func hasPauseButtonPressed(_ sender: Any) {
    pauseButton.isHidden = true
    startButton.isHidden = false
    
    stopWatchTimer.invalidate()
  }
  
  @objc func updateTime(){
    currentTime += 1
    minutesCount = (currentTime / 60)
    secondsCount = (currentTime % 60)
    
    if currentTime == 3600 {
      hoursCount += 1
      currentTime = 0
    }
    //lo siguiente no va funcionar si no has creado el timeLabel
    timeLabel.text = String(format:"%02i:%02i:%02i", hoursCount, minutesCount, secondsCount)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    pauseButton.isHidden = true
    stopButton.isEnabled = false
    
  }
}

