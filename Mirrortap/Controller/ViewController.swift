//
//  ViewController.swift
//  Mirrortap
//
//  Created by Syamsul Falah on 12/05/19.
//  Copyright © 2019 Falah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentQuestion: Int = 1
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet var questionImageView: UIImageView!
    @IBOutlet var mirrorImageView: UIImageView!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var botView: UIView!
    
    var questionShapes = [ShapesQuestion]()
    
    var timeRunning = false
    var timeCounter: Timer = Timer()
    var timer = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createQuestion()
        setImageQuestionView(currentQuestion: currentQuestion)
        
        if timeRunning == false {
            timeCounter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counting), userInfo: nil, repeats: true)
        }
    }
    
    func createQuestion(){
        questionShapes.append(ShapesQuestion(shapes: "shapes1_ori", shapesGrey: "shapes_Ask_Blue_Top"))           // Q1
        questionShapes.append(ShapesQuestion(shapes: "shapes_Ask_Yellow_Top", shapesGrey: "shapes2_ori"))             // Q2
        questionShapes.append(ShapesQuestion(shapes: "shapes3_ori", shapesGrey: "shapes_Ask_Blue_Top"))           // Q3
        questionShapes.append(ShapesQuestion(shapes: "shapes_Ask_Yellow_Top", shapesGrey: "shapes4_ori"))             // Q4
        questionShapes.append(ShapesQuestion(shapes: "shapes5_ori", shapesGrey: "shapes_Ask_Blue_Top"))           // Q5
        questionShapes.append(ShapesQuestion(shapes: "shapes_Ask_Yellow_Top", shapesGrey: "shapes6_ori"))       // Q6
//        questionShapes.append(ShapesQuestion(shapes: "shapes7_ori", shapesGrey: "shapes_Ask_Blue_Top"))       // Q7
//        questionShapes.append(ShapesQuestion(shapes: "shapes_Ask_Yellow_Top", shapesGrey: "shapes8_ori"))     // Q8
//        questionShapes.append(ShapesQuestion(shapes: "shapes9_ori", shapesGrey: "shapes_Ask_Blue_Top"))       //  Q9
//        questionShapes.append(ShapesQuestion(shapes: "shapes_Ask_Yellow_Top", shapesGrey: "shapes10_ori"))    // Q10
    }
    
    func setImageQuestionView(currentQuestion: Int){
        let questionImage = UIImage(named: questionShapes[currentQuestion-1].shapes)
        questionImageView = UIImageView(image: questionImage)
        questionImageView.contentMode = .scaleAspectFit
        self.upView.addSubview(questionImageView)
        
        questionImageView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: questionImageView as Any, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: upView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: questionImageView as Any, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: upView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: questionImageView as Any, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 250)
        let heightConstraint = NSLayoutConstraint(item: questionImageView as Any, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 250)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        
        
        let questionMirror = UIImage(named: questionShapes[currentQuestion-1].shapesGrey)
        mirrorImageView = UIImageView(image: questionMirror)
        mirrorImageView.contentMode = .scaleAspectFit
        self.botView.addSubview(mirrorImageView)
        
        mirrorImageView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraintMirror = NSLayoutConstraint(item: mirrorImageView as Any, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: botView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraintMirror = NSLayoutConstraint(item: mirrorImageView as Any, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: botView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraintMirror = NSLayoutConstraint(item: mirrorImageView as Any, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 250)
        let heightConstraintMirror = NSLayoutConstraint(item: mirrorImageView as Any, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 250)
        view.addConstraints([horizontalConstraintMirror, verticalConstraintMirror, widthConstraintMirror, heightConstraintMirror])
    }
    
    @objc func counting(){
        
        if currentQuestion % 2 == 1 {
            mirrorImageView.flash()
        } else {
            questionImageView.flash()
        }
        
        timer -= 1
        if timer == 0 {
            timeCounter.invalidate()
            timeRunning = true
            
            self.performSegue(withIdentifier: "toChoice", sender: self)
        }
    }
    
    func resetQuestion(){
        self.currentQuestion = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ChoiceViewController
        
        dest.currentQuestionChoice = self.currentQuestion
    }
}

extension UIImageView {
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.4
        flash.fromValue = 1
        flash.toValue = 0.5
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
}
