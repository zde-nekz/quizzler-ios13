//
//  ViewController.swift
//  quizzler
//
//  Created by Zdeněk Škrobák on 12.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
   
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var thirdOption: UIButton!
    
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
        
        let options = quizBrain.getOptions()
        
        firstOption.backgroundColor = UIColor.clear
        secondOption.backgroundColor = UIColor.clear
        thirdOption.backgroundColor = UIColor.clear
        
        firstOption.setTitle(options[0], for: .normal)
        secondOption.setTitle(options[1], for: .normal)
        thirdOption.setTitle(options[2], for: .normal)
        
        progressView.progress = quizBrain.getProgress()
        
    }

}

