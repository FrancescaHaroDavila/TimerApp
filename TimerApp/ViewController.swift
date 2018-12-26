//
//  ViewController.swift
//  TimerApp
//
//  Created by Francesca Valeria Haro Dávila on 12/26/18.
//  Copyright © 2018 Belatrix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var hoursLabel: UILabel!
  @IBOutlet weak var minutesLLabel: UILabel!
  @IBOutlet weak var secondsLabel: UILabel!
  @IBOutlet weak var stopButton: UIButton!
  @IBOutlet weak var pauseButton: UIButton!
  @IBOutlet weak var startButton: UIButton!
  
  var stopWatchTimer = Timer()
  var currentTime = 1
  var hoursCount = 0
  
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
    
    currentTime = 0
    hoursLabel.text = "00"
    minutesLLabel.text = "00"
    secondsLabel.text = "00"
    
    stopWatchTimer.invalidate()
  }
  
  @IBAction func hasPauseButtonPressed(_ sender: Any) {
    pauseButton.isHidden = true
    startButton.isHidden = false
    
    stopWatchTimer.invalidate()
  }
  
  @objc func updateTime(){
    currentTime += 1
    minutesLLabel.text = String("\(currentTime / 60 )")
    secondsLabel.text = String("\(currentTime % 60)")
    
    if currentTime == 3600 {
      hoursCount += 1
      hoursLabel.text = String(hoursCount)
      currentTime = 0
    }
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    pauseButton.isHidden = true
    stopButton.isEnabled = false
    
      }
}

