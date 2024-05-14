//
//  ViewController.swift
//  HIRAGANA
//
//  Created by Anton Angel on 05/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var taskImage: UIImageView!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var ButtonTwo: UIButton!
    
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBOutlet weak var buttonFour: UIButton!
    
    @IBOutlet weak var buttonStart: UIButton!
    
    var interface : Interface!
    var questionList : QuestionList!
    var test : Test!
    var score : Score!
    
    var mistakes = 0
    var seconds = 1
    var minutes = 0
    var font = UIFont.systemFont(ofSize: 35)
    
    var defaultColor: UIColor = .link
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionList = QuestionList()
        
        interface = Interface(buttonOne: buttonOne, buttonTwo: ButtonTwo, buttonThree: buttonThree, buttonFour: buttonFour, buttonStart: buttonStart, scoreLabel: scoreLabel, timerLabel: timerLabel, taskImage: taskImage, progressBar: progressBar)
        score = Score(interface: interface, monograph: questionList.monograph)
        
        test = Test(interface: interface, questionList: questionList, score: score)
        score.doDefaults()
        interface.firstView()
                
    }
    
    @IBAction func startButtonPressd(_ sender: UIButton) {
        test.startTest()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        test.checkAnswer(sender)
        
        
        
    }
    
}


    


