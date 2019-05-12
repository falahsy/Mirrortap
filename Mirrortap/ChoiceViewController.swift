//
//  ChoiceViewController.swift
//  Mirrortap
//
//  Created by Syamsul Falah on 12/05/19.
//  Copyright © 2019 Falah. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    var shapesModel = [ShapesModel]()

    @IBOutlet weak var choiceA_Button: UIButton!
    @IBOutlet weak var choiceB_Button: UIButton!
    @IBOutlet weak var choiceC_Button: UIButton!
    
    var answerUser: Int = 0
    var answerKey: Int = 0
    
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createShapesObject()
        setButtonImage(index: UserDefaults.standard.integer(forKey: "currentShapes"))
        
        
    }
    
    func createShapesObject() {
        let shape1 = ShapesModel(shapesMirror: "BelahKetupat_Mirror", choice1: "BelahKetupat_Pilihan1", choice2: "BelahKetupat_Pilihan2")
        let shape2 = ShapesModel(shapesMirror: "Persegi_Mirror", choice1: "Persegi_Pilihan1", choice2: "Persegi_Pilihan2")
        
        shapesModel.append(shape1)
        shapesModel.append(shape2)
    }
    
    
    func setButtonImage(index: Int){
        let randomIndex = Int.random(in: 0...5)
        
        if randomIndex == 0 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index].shapesMirror), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index].choice1), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index].choice2), for: .normal)
            answerKey = 0
        } else if randomIndex == 1 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index].shapesMirror), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index].choice2), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index].choice1), for: .normal)
            answerKey = 0
        } else if randomIndex == 2 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index].choice1), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index].shapesMirror), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index].choice2), for: .normal)
            answerKey = 1
        } else if randomIndex == 3 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index].choice2), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index].shapesMirror), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index].choice1), for: .normal)
            answerKey = 1
        } else if randomIndex == 4 {
            choiceA_Button.setImage(UIImage(named: shapesModel[index].choice1), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index].choice2), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index].shapesMirror), for: .normal)
            answerKey = 2
        } else {
            choiceA_Button.setImage(UIImage(named: shapesModel[index].choice2), for: .normal)
            choiceB_Button.setImage(UIImage(named: shapesModel[index].choice1), for: .normal)
            choiceC_Button.setImage(UIImage(named: shapesModel[index].shapesMirror), for: .normal)
            answerKey = 2
        }
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
        nextShapes()
        
        self.performSegue(withIdentifier: "backToQuestion", sender: self)
    }
    
    @IBAction func choiceB_tapped(_ sender: UIButton) {
        answerUser = 1
        checkAnswer()
        nextShapes()
        
        self.performSegue(withIdentifier: "backToQuestion", sender: self)
    }
    
    @IBAction func choiceC_tapped(_ sender: UIButton) {
        answerUser = 2
        checkAnswer()
        nextShapes()
        
        self.performSegue(withIdentifier: "backToQuestion", sender: self)
    }
    
    func nextShapes() {
        if UserDefaults.standard.integer(forKey: "currentShapes") == shapesModel.count-1 {
            resetShapes()
        } else {
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "currentShapes") + 1, forKey: "currentShapes")
        }
    }
    
    func resetShapes() {
        UserDefaults.standard.set(0, forKey: "currentShapes")
    }
}
