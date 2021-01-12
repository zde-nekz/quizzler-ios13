//
//  ViewController.swift
//  quizzler
//
//  Created by Zdeněk Škrobák on 12.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIStackView!
    
    var questionNumber = 0
    
    let quiz = [
        ["Four plus Two is equal to Six", "True"],
        ["Five minus Three is greater than One", "True"],
        ["Three plus Eight is less than Ten", "False"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
    }


    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        let answer = sender.currentTitle!
        
        if (answer == quiz[questionNumber][1]) {
            print("Right")
        } else {
            print("Wrong")
        }
        
        if (questionNumber < quiz.count - 1) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateUi()
        
        
    }
    
    func updateUi() {
        questionLabel.text = quiz[questionNumber][0]
    }
}

