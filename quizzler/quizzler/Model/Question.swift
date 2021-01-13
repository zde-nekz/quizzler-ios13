//
//  Question.swift
//  quizzler
//
//  Created by Zdeněk Škrobák on 13.01.2021.
//

import Foundation

struct Question
{
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
