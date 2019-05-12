//
//  ViewController.swift
//  Mirrortap
//
//  Created by Syamsul Falah on 12/05/19.
//  Copyright © 2019 Falah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!

    
    var timeRunning = false
    var timeCounter: Timer = Timer()
    var timer = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if timeRunning == false {
            timeCounter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counting), userInfo: nil, repeats: true)
        }
    }

    @objc func counting(){
        timer -= 1
        timerLabel.text = timer.description
        if timer == 0 {
            timeCounter.invalidate()
            timeRunning = true
            self.performSegue(withIdentifier: "toChoice", sender: self)
        }
    }
}

