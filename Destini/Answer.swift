//
//  Answer.swift
//  Destini
//
//  Created by atao1 on 9/10/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Answer {
    
    let answerText: String
    var nextStory: Story! = nil
    
    init(answer: String) {
        answerText = answer
    }
    
}
