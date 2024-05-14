//
//  View.swift
//  HIRAGANA
//
//  Created by Anton Angel on 12/05/2024.
//

import Foundation
import UIKit

class Interface {
    var buttonOne: UIButton
    var buttonTwo: UIButton
    var buttonThree: UIButton
    var buttonFour: UIButton
    var buttonStart: UIButton
    var scoreLabel: UILabel
    var timerLabel: UILabel
    var taskImage: UIImageView
    var progressBar: UIProgressView
    var buttonsFont = UIFont.systemFont(ofSize: 30)
    var labelsFont = UIFont.systemFont(ofSize: 38, weight: .semibold)
    var defaultColor: UIColor = .link
    
    
    init(buttonOne: UIButton, buttonTwo: UIButton, buttonThree: UIButton, buttonFour: UIButton, buttonStart: UIButton, scoreLabel: UILabel,timerLabel: UILabel, taskImage: UIImageView, progressBar: UIProgressView) {
        self.scoreLabel = scoreLabel
        self.timerLabel = timerLabel
        self.taskImage = taskImage
        self.progressBar = progressBar
        self.buttonStart = buttonStart
        self.buttonOne = buttonOne
        self.buttonTwo = buttonTwo
        self.buttonThree = buttonThree
        self.buttonFour = buttonFour
    }
    
    func firstView() {
        self.scoreLabel.isHidden = false
        self.scoreLabel.text = "Ready?"
        self.scoreLabel.font = labelsFont
        self.timerLabel.font = labelsFont
        self.scoreLabel.textColor = .black
        self.timerLabel.textColor = .black
        self.buttonStart.isHidden = false
        self.taskImage.isHidden = true
        self.progressBar.isHidden = true
        self.progressBar.progress = 0
        self.buttonOne.isHidden = true
        self.buttonTwo.isHidden = true
        self.buttonThree.isHidden = true
        self.buttonFour.isHidden = true
        self.buttonOne.backgroundColor = .systemBlue
        self.buttonTwo.backgroundColor = .systemBlue
        self.buttonThree.backgroundColor = .systemBlue
        self.buttonFour.backgroundColor = .systemBlue
        self.buttonStart.backgroundColor = .systemBlue
        
    }
    
    func firstViewAgain(result:Int) {
        firstView()
        self.scoreLabel.text = "Score:\(result)"
        self.timerLabel.text = "Try Again?"
        
    }
    
    func finalView(result:Int) {
        self.timerLabel.text = "Time-\(self.timerLabel.text!)"
        firstView()
        self.scoreLabel.text = "Score:\(result)"

        
        
    }

    func testView() {
        self.scoreLabel.text = "0"
        self.buttonStart.isHidden = true
        self.scoreLabel.isHidden = false
        self.taskImage.isHidden = false
        self.progressBar.isHidden = false
        self.buttonOne.isHidden = false
        self.buttonTwo.isHidden = false
        self.buttonThree.isHidden = false
        self.buttonFour.isHidden = false
    }
       
        
    
    
    func setFonts() {
        buttonOne.titleLabel?.font = buttonsFont
        buttonTwo.titleLabel?.font = buttonsFont
        buttonThree.titleLabel?.font = buttonsFont
        buttonFour.titleLabel?.font = buttonsFont
        buttonStart.titleLabel?.font = buttonsFont
            
    }
    
    func buttonBlink(_ sender:UIButton, _ color:UIColor) {
            sender.backgroundColor = color
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
                sender.backgroundColor = .systemBlue
            }
        }
}
