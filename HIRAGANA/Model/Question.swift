//
//  Question.swift
//  HIRAGANA
//
//  Created by Anton Angel on 13/05/2024.
//

import Foundation

class Question {
    let vovel:String
    let correctAnswer:String
    var choisableAnswers:[String]
    
    init(vovel: String, monographs: [String]) {
        self.vovel = vovel
        self.correctAnswer = vovel
        self.choisableAnswers = [monographs.randomElement()!,monographs.randomElement()!,
                                 monographs.randomElement()!, vovel].shuffled()
        
    }
}
