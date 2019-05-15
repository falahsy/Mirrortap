//
//  ChoiceViewController.swift
//  Mirrortap
//
//  Created by Syamsul Falah on 12/05/19.
//  Copyright © 2019 Falah. All rights reserved.
//

import UIKit
import AVFoundation

class ChoiceViewController: UIViewController, AVAudioPlayerDelegate {
    
    var shapesModel = [ShapesModel]()

    @IBOutlet weak var choiceA_Button: UIButton!
    @IBOutlet weak var choiceB_Button: UIButton!
    @IBOutlet weak var choiceC_Button: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    
    var answerUser: Int = 0
    var answerKey: Int = 0
    
    var currentQuestionChoice = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createShapesObject()
        setButtonImage(index: self.currentQuestionChoice)
        
        restartButton.isHidden = true
    }
    
    func createShapesObject() {
        let shape1 = ShapesModel(shapesMirror: "shapes1_mirror", choice1: "shapes1_choiceX", choice2: "shapes1_choiceY")
        let shape2 = ShapesModel(shapesMirror: "shapes2_mirror", choice1: "shapes2_choiceX", choice2: "shapes2_choiceY")
//        let shape3 = ShapesModel(shapesMirror: "shapes3_mirror", choice1: "shapes3_choiceX", choice2: "shapes3_choiceY")
//        let shape4 = ShapesModel(shapesMirror: "shapes4_mirror", choice1: "shapes4_choiceX", choice2: "shapes4_choiceY")
//        let shape5 = ShapesModel(shapesMirror: "shapes5_mirror", choice1: "shapes5_choiceX", choice2: "shapes5_choiceY")
//        let shape6 = ShapesModel(shapesMirror: "shapes6_mirror", choice1: "shapes6_choiceX", choice2: "shapes6_choiceY")
//        let shape7 = ShapesModel(shapesMirror: "shapes7_mirror", choice1: "shapes7_choiceX", choice2: "shapes7_choiceY")
//        let shape8 = ShapesModel(shapesMirror: "shapes8_mirror", choice1: "shapes8_choiceX", choice2: "shapes8_choiceY")
//        let shape9 = ShapesModel(shapesMirror: "shapes9_mirror", choice1: "shapes9_choiceX", choice2: "shapes9_choiceY")
//        let shape10 = ShapesModel(shapesMirror: "shapes10_mirror", choice1: "shapes10_choiceX", choice2: "shapes10_choiceY")
        
        shapesModel.append(shape1)
        shapesModel.append(shape2)
//        shapesModel.append(shape3)
//        shapesModel.append(shape4)
//        shapesModel.append(shape5)
//        shapesModel.append(shape6)
//        shapesModel.append(shape7)
//        shapesModel.append(shape8)
//        shapesModel.append(shape9)
//        shapesModel.append(shape10)
    }
    
    
    func setButtonImage(index: Int){
        let randomIndex = Int.random(in: 0...5)
        
        if randomIndex == 0 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index-1].shapesMirror), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index-1].choice1), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index-1].choice2), for: .normal)
            answerKey = 0
        } else if randomIndex == 1 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index-1].shapesMirror), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index-1].choice2), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index-1].choice1), for: .normal)
            answerKey = 0
        } else if randomIndex == 2 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index-1].choice1), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index-1].shapesMirror), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index-1].choice2), for: .normal)
            answerKey = 1
        } else if randomIndex == 3 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index-1].choice2), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index-1].shapesMirror), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index-1].choice1), for: .normal)
            answerKey = 1
        } else if randomIndex == 4 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index-1].choice1), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index-1].choice2), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index-1].shapesMirror), for: .normal)
            answerKey = 2
        } else {
            choiceA_Button.setImage(UIImage(named: shapesModel[index-1].choice2), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index-1].choice1), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index-1].shapesMirror), for: .normal)
            answerKey = 2
        }
    }
    
    func checkAnswer() -> Bool {
        if answerUser == answerKey {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func choiceA_tapped(_ sender: UIButton) {
        answerUser = 0
        validateAnswerToPlaySound(button: sender)
    }
    
    @IBAction func choiceB_tapped(_ sender: UIButton) {
        answerUser = 1
        validateAnswerToPlaySound(button: sender)
    }
    
    @IBAction func choiceC_tapped(_ sender: UIButton) {
        answerUser = 2
        validateAnswerToPlaySound(button: sender)
    }
    
    func validateAnswerToPlaySound(button: UIButton){
        if checkAnswer() == true {
            playAudioFile(audioName: "correct")
            button.flash()
            nextShapes()
        } else {
            UIDevice.vibrate()
            button.shakeAnimation()
            rotateChoiceAnimation()
            playAudioFile(audioName: "incorrect")
        }
    }
    
    func rotateChoiceAnimation(){
        self.choiceA_Button.topToBottom()
        self.choiceB_Button.middleToTop()
        self.choiceC_Button.bottomToMiddle()
        
        let tempButton = choiceA_Button
        self.choiceA_Button = choiceB_Button
        self.choiceB_Button = choiceC_Button
        self.choiceC_Button = tempButton
        
        self.choiceA_Button.rotate()
        self.choiceB_Button.rotate()
        self.choiceC_Button.rotate()
    }
    
    
    
    func nextShapes() {
        if self.currentQuestionChoice == shapesModel.count {
            self.restartButton.isHidden = false
            self.restartButton.pulsate()
        } else {
            self.currentQuestionChoice += 1
            self.performSegue(withIdentifier: "backToQuestion", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ViewController
        
        dest.currentQuestion = self.currentQuestionChoice
    }
    
    func startOver(){
        self.currentQuestionChoice = 1
        self.performSegue(withIdentifier: "backToQuestion", sender: self)
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        startOver()
    }
    
    func playAudioFile(audioName: String) {
        if let audioPlayer = audioPlayer, audioPlayer.isPlaying { audioPlayer.stop() }
        
        guard let soundURL = Bundle.main.url(forResource: audioName, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
}

extension UIButton {
    
    func shakeAnimation() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0.1
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 1
        flash.fromValue = 1
        flash.toValue = 0.5
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    // tengah ke atas
    func middleToTop() {
        UIView.animate(withDuration: 1.5, animations: {
            self.frame.origin.y -= 160
        }, completion: nil)
    }
    
    // atas ke bawah
    func topToBottom() {
        UIView.animate(withDuration: 1.5, animations: {
            self.frame.origin.y += 320
        }, completion: nil)
    }
    
    // bawah ke tengah
    func bottomToMiddle() {
        UIView.animate(withDuration: 1.5, animations: {
            self.frame.origin.y -= 160
        }, completion: nil)
    }
    
    func rotate() {
        UIView.animate(withDuration: 1.5, animations: {
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: -0.999*CGFloat(Double.pi))
            } else {
                self.transform = .identity
            }
        }, completion: nil)
    }
}
