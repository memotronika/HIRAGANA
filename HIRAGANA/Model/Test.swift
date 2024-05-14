//
//  Test.swift
//  HIRAGANA
//
//  Created by Anton Angel on 12/05/2024.
//

import Foundation
import UIKit

class Test {
    
    var interface : Interface!
    var timer : Timer!
    var questionList : QuestionList
    var score : Score!
    
    init(interface: Interface!, questionList: QuestionList!, score:Score!) {
        self.interface = interface
        self.questionList = questionList
        self.score = score
    }
    
    func startTest() {
        nextQuestion(question: questionList.queue[0])
        interface.timerLabel.text = "0:00"
        interface.testView()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.score.updateTimer(1)
        }
        interface.buttonStart.setTitle("Test again", for: .normal)
        
    }
    
    func nextQuestion(question:Question) {
        interface.taskImage.image = UIImage(named: question.vovel)
        interface.buttonOne.setTitle(question.choisableAnswers[0], for: .normal)
        interface.buttonTwo.setTitle(question.choisableAnswers[1], for: .normal)
        interface.buttonThree.setTitle(question.choisableAnswers[2], for: .normal)
        interface.buttonFour.setTitle(question.choisableAnswers[3], for: .normal)
        interface.setFonts()
        
    }
    
    func endTest() {
        interface.firstViewAgain(result : score.score)
        prepForNextTest()
    }
    func passTest() {
        interface.finalView(result : score.score)
        prepForNextTest()
    }
    
    func checkAnswer(_ sender:UIButton) {
        if questionList.queue[0].correctAnswer == sender.currentTitle! {
            score.score += 1
            score.updateScore()
            questionList.queue.removeFirst()
            interface.buttonBlink(sender, .green)
            score.updateProgress()
        } else {
            questionList.queue[0].choisableAnswers = questionList.queue[0].choisableAnswers.shuffled()
            questionList.queue.append(questionList.queue.removeFirst())
            score.mistakes += 1
            interface.buttonBlink(sender, .red)
            if score.mistakes == score.maxMistakes {endTest()}
        }
        if !questionList.queue.isEmpty {nextQuestion(question: questionList.queue[0])}
        else {passTest()}
    }
    
    func prepForNextTest(){
        timer.invalidate()
        score.doDefaults()
        questionList.refillQueue()
    }
}
