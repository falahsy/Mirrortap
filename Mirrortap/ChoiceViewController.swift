//
//  ChoiceViewController.swift
//  Mirrortap
//
//  Created by Syamsul Falah on 12/05/19.
//  Copyright © 2019 Falah. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBOutlet weak var choiceA_Button: UIButton!
    @IBOutlet weak var choiceB_Button: UIButton!
    @IBOutlet weak var choiceC_Button: UIButton!
    
    let shapesMirror = ["BelahKetupat_Mirror","Persegi_Mirror"]
    let choice1 = ["BelahKetupat_Pilihan1","Persegi_Pilihan1"]
    let choice2 = ["BelahKetupat_Pilihan2","Persegi_Pilihan2"]
    
    var answerUser: Int = -1
    var answerKey: Int = 0
    
    var onGoingQuestionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonImage(index: onGoingQuestionNumber)
    }
    
    func setButtonImage(index: Int){
        let randomIndex = Int.random(in: 0...5)
        
        if randomIndex == 0 {
            choiceA_Button.setImage(UIImage(named: shapesMirror[index]), for: .normal)
            choiceB_Button.setImage(UIImage(named: choice1[index]), for: .normal)
            choiceC_Button.setImage(UIImage(named: choice2[index]), for: .normal)
            answerKey = 0
        } else if randomIndex == 1 {
            choiceA_Button.setImage(UIImage(named: shapesMirror[index]), for: .normal)
            choiceB_Button.setImage(UIImage(named: choice2[index]), for: .normal)
            choiceC_Button.setImage(UIImage(named: choice1[index]), for: .normal)
            answerKey = 0
        } else if randomIndex == 2 {
            choiceA_Button.setImage(UIImage(named: choice1[index]), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesMirror[index]), for: .normal)
            choiceC_Button.setImage(UIImage(named: choice2[index]), for: .normal)
            answerKey = 1
        } else if randomIndex == 3 {
            choiceA_Button.setImage(UIImage(named: choice2[index]), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesMirror[index]), for: .normal)
            choiceC_Button.setImage(UIImage(named: choice1[index]), for: .normal)
            answerKey = 1
        } else if randomIndex == 4 {
            choiceA_Button.setImage(UIImage(named: choice1[index]), for: .normal)
            choiceB_Button.setImage(UIImage(named: choice2[index]), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesMirror[index]), for: .normal)
            answerKey = 2
        } else {
            choiceA_Button.setImage(UIImage(named: choice2[index]), for: .normal)
            choiceB_Button.setImage(UIImage(named: choice1[index]), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesMirror[index]), for: .normal)
            answerKey = 2
        }
        print(randomIndex)
    }
    
    func checkAnswer() {
        if answerUser == answerKey {
            print("True")
        } else {
            print("False")
        }
    }
    
    @IBAction func choiceA_tapped(_ sender: UIButton) {
        answerUser = 0
        checkAnswer()
    }
    
    @IBAction func choiceB_tapped(_ sender: UIButton) {
        answerUser = 1
        checkAnswer()
    }
    
    @IBAction func choiceC_tapped(_ sender: UIButton) {
        answerUser = 2
        checkAnswer()
    }
    
    
}
