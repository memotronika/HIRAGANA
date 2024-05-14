//
//  QuestionList.swift
//  HIRAGANA
//
//  Created by Anton Angel on 13/05/2024.
//

import Foundation

class QuestionList{
    var queue : [Question]!
    var monograph : Monograph!
    init() {
        monograph = Monograph()
        self.queue = createQuestionsQueue().shuffled()
    }
    
    func createQuestionsQueue() -> [Question] {
        var queue : [Question] = []
        for vovel in monograph.monographsList.shuffled() {
            queue.append(Question(vovel : vovel, monographs : monograph.monographsList))
        }
        return queue
    }
    
    func refillQueue() {
        self.queue = createQuestionsQueue()
    }
}
