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
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
    }


    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        let answer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(answer)
        
        if (userGotItRight) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUi() {
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        progressView.progress = quizBrain.getProgress()
        
    }

}

