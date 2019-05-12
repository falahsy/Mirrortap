//
//  ViewController.swift
//  Mirrortap
//
//  Created by Syamsul Falah on 12/05/19.
//  Copyright © 2019 Falah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentQuestion: Int = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet var questionImageView: UIImageView!
    @IBOutlet var mirrorImageView: UIImageView!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var botView: UIView!
    
    var questionShapes = [ShapesQuestion]()
    
    var timeRunning = false
    var timeCounter: Timer = Timer()
    var timer = 5
    
    var question1: ShapesQuestion?
    var question2: ShapesQuestion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createQuestion()
        setImageQuestionView(currentQuestion: UserDefaults.standard.integer(forKey: "currentQuestion"))
        
        
        if timeRunning == false {
            timeCounter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counting), userInfo: nil, repeats: true)
        }
    }
    
    func createQuestion(){
        question1 = ShapesQuestion(shapes: "BelahKetupat", shapesGrey: "BelahKetupat_Grey")
        question2 = ShapesQuestion(shapes: "Persegi", shapesGrey: "Persegi_Grey")
        
        questionShapes.append(question1!)
        questionShapes.append(question2!)
    }
    
    func setImageQuestionView(currentQuestion: Int){
        let questionImage = UIImage(named: questionShapes[currentQuestion].shapes)
        let questionMirror = UIImage(named: questionShapes[currentQuestion].shapesGrey)
        
        questionImageView = UIImageView(image: questionImage)
        mirrorImageView = UIImageView(image: questionMirror)

        self.upView.addSubview(questionImageView)
        self.botView.addSubview(mirrorImageView)
    }
    
    @objc func counting(){
        timer -= 1
        timerLabel.text = timer.description
        if timer == 0 {
            timeCounter.invalidate()
            timeRunning = true
            nextQuestion()
            
            self.performSegue(withIdentifier: "toChoice", sender: self)
        }
    }
    
    func nextQuestion() {
        if UserDefaults.standard.integer(forKey: "currentQuestion") == questionShapes.count-1 {
            resetQuestion()
        } else {
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "currentQuestion") + 1, forKey: "currentQuestion")
        }
    }
    
    func resetQuestion(){
        UserDefaults.standard.set(0, forKey: "currentQuestion")
    }
}

