//
//  Question.swift
//  Quizzler
//
//  Created by Hajri Mohamed Amine on 10/08/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let answer : Bool
    
    init(text : String, answer : Bool) {
        self.questionText = text
        self.answer = answer
    }
}
