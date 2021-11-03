//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var resultText: UILabel!
    
    var answerChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // Вычисление итогового животного.
        

        // Почему ругается на flatmap что он устаревший? У меня же элементы явно не опциональные, к тому же мне надо получить плоский массив так как часть ответов являются массивами (в случае, если ответов несколько).
        let animalsList = answerChosen.flatMap {$0.type}
   
        // Преобразование массива в словарь [AnimalType : Count_of_answers_for_this_animal]
        let animalVotes = animalsList.reduce(into: [:])
            { animals, animal in animals[animal, default: 0] += 1}
        
        // Выбор животного с наибольшим числом голосов
        var animalFinal: AnimalType = .cat
        var animaMaxVotes = 0
        
        for animal in animalVotes {
            if animal.value > animaMaxVotes {
                animalFinal = animal.key
                animaMaxVotes = animal.value
            }
        }
        
  
        resultTitle.text = "Вы - " + String(animalFinal.rawValue)
        resultText.text = animalFinal.definition

        
    
    }

    
}

