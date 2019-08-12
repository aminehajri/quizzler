//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let questionBank = QuestionBank()
    var questionsCount : Int = 0
    var questionPosition : Int = 0
    var isTheAnswerTrue : Bool = false
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsCount = questionBank.list.count
        
        
        updateScore()
        updateGameLevel()
        nextQuestion()
        
    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        
        if questionPosition < questionsCount{
            if( sender.tag == 1 ){
                checkAnswer(answer: true)        }
            else if( sender.tag == 2){
                checkAnswer(answer: false)        }
            updateScore()
            updateGameLevel()
        }
        
        nextQuestion()
        
        
        
    }
    
    
    func updateScore() {
        if(isTheAnswerTrue){
            score+=1
            scoreLabel.text = "Score : \(score)"
        }
        
        
    }
    func updateGameLevel()  {
        progressBar.frame.size.width = (view.frame.size.width/CGFloat(questionsCount)) * CGFloat(questionPosition+1)
        progressLabel.text = "\(questionPosition + 1)/\(questionsCount)"
    }
    
    func nextQuestion() {
        questionPosition += 1
        if questionPosition < questionsCount {
            questionLabel.text = questionBank.list[questionPosition].questionText
        }
        else{
            let quizzAlert = UIAlertController(title: "Awsome", message: "Do you want to restart the quizz ?", preferredStyle: .alert)
            let quizzAlertAction = UIAlertAction(title: "restart", style: .default, handler:{ (UIAlertController) in self.startOver()})
            quizzAlert.addAction(quizzAlertAction)
            present(quizzAlert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer(answer : Bool) {
        
        if(questionBank.list[questionPosition].answer == answer){
            isTheAnswerTrue = true
            ProgressHUD.showSuccess("correct answer")
            
        }
        else{
            isTheAnswerTrue = false
            ProgressHUD.showError("wrong answer")
        }
        
        
        
    }
    
    
    func startOver() {
        questionPosition = -1
        score = -1
        isTheAnswerTrue = true
        nextQuestion()
        updateScore()
        updateGameLevel()
        
    }
    
    
    
}
