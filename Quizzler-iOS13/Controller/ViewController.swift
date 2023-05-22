//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var trueButton: UIButton!
	@IBOutlet weak var falseButton: UIButton!
	@IBOutlet weak var progressBar: UIProgressView!
	
	var quizBrain = QuizBrain()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		updateUI()
	}
	@IBAction func aswerButtonPressed(_ sender: UIButton) {
			
		let userAnswer = sender.currentTitle!
		let userGotItRight = quizBrain.checkAnswer(userAnswer)
		
		if userGotItRight {
			sender.backgroundColor = UIColor.green
		} else {
			sender.backgroundColor = UIColor.red
		}
			
		quizBrain.nextQuestion()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
				self.updateUI()
			}
	}
	
	func updateUI() {
		questionLabel.text = quizBrain.getQuestionText()
		progressBar.progress = quizBrain.getProgress()
		scoreLabel.text = "Score : \(quizBrain.getScore())"

		if trueButton.backgroundColor != UIColor.clear || falseButton.backgroundColor != UIColor.clear {
			trueButton.backgroundColor = UIColor.clear
			falseButton.backgroundColor = UIColor.clear
		}
	}

}
