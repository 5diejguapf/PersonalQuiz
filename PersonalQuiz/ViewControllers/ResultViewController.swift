//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var answers: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        descriptionLabel.text = ""
        navigationItem.hidesBackButton = true
        
        setAnswerResult()
    }
 
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func setAnswerResult() {
        let resultAnimal = calcAnswerResult()
        if let animal = resultAnimal {
            resultLabel.text = "Вы - \(animal.rawValue)"
            descriptionLabel.text = animal.definition
        } else {
            resultLabel.text = "Вы - 🐙"
            descriptionLabel.text = "К сожалению, нам не удалось отпределить результат"
        }
    }
    
    private func calcAnswerResult() -> AnimalType? {
        var scores: [AnimalType: Int] = [:]
        for answer in answers {
            scores[answer.type, default: 0] += 1
        }
        let highScore = scores.sorted { $0.value > $1.value }.first
        return scores.filter {$0.value == highScore?.value}.randomElement()?.key
    }
    
}
