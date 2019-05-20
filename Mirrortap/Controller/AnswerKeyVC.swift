//
//  AnswerKeyVC.swift
//  Mirrortap
//
//  Created by Syamsul Falah on 16/05/19.
//  Copyright © 2019 Falah. All rights reserved.
//

import UIKit

class AnswerKeyVC: UIViewController {
    @IBOutlet weak var restartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restartButton.pulsate()
        restartButton.flash()
    }
    
    @IBAction func restart(_ sender: UIButton) {
        performSegue(withIdentifier: "restartSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? ViewController
        
        dest?.currentQuestion = 1
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
