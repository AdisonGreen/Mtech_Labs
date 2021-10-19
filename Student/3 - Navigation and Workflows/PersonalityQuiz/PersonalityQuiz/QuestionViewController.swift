//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Adison Green on 9/30/21.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var answersChosen: [Answer] = []
    var questionIndex = 0
    var questions: [Question] = [
        Question(
            text: "Which food do you like the most?",
            type: .single,
            answers: [
                Answer(text: "Steak", type: .Rockruff),
                Answer(text: "Fish", type: .Shinx),
                Answer(text: "Carrots", type: .Scorbunny),
                Answer(text: "Salad", type: .Turtwig)
            ]
        ),
        Question(
            text: "Which activities do you enjoy most?",
            type: .multiple,
            answers: [
                Answer(text: "Walking", type: .Turtwig),
                Answer(text: "Sleeping", type: .Shinx),
                Answer(text: "Running", type: .Scorbunny),
                Answer(text: "Eating", type: .Rockruff)
            ]
        ),
        Question(
            text: "How much do you enjoy car rides?",
            type: .ranged,
            answers: [
                Answer(text: "I dislike them", type: .Shinx),
                Answer(text: "I get a little nervous", type: .Scorbunny),
                Answer(text: "I barely notice them", type: .Turtwig),
                Answer(text: "I love them", type: .Rockruff)
            ]
        ),
        Question(
            text: "Which do you do in your free time?",
            type: .multiple,
            answers: [
                Answer(text: "Movies", type: .Turtwig),
                Answer(text: "Nothing", type: .Shinx),
                Answer(text: "Go walking or hiking", type: .Scorbunny),
                Answer(text: "Hangout with people", type: .Rockruff)
            ]
        ),
        Question(
            text: "How much do you enjoy being around other people?",
            type: .ranged,
            answers: [
                Answer(text: "Not at all", type: .Shinx),
                Answer(text: "If it is people I know", type: .Turtwig),
                Answer(text: "I like to be around people", type: .Scorbunny),
                Answer(text: "Love it", type: .Rockruff)
            ]
        ),
        Question(
            text: "How often to you make new friends?",
            type: .single,
            answers: [
                Answer(text: "Rarely", type: .Shinx),
                Answer(text: "When I can", type: .Turtwig),
                Answer(text: "A decent amount", type: .Scorbunny),
                Answer(text: "All the time", type: .Rockruff)
            ]
        ),
        Question(
            text: "How do your days usually go?",
            type: .single,
            answers: [
                Answer(text: "I plan how it all goes", type: .Rockruff),
                Answer(text: "Just go with the flow", type: .Turtwig),
                Answer(text: "Plan it out better never goes how it is planned", type: .Scorbunny),
                Answer(text: "My days just always fall apart", type: .Shinx)
            ]
        ),
        Question(
            text: "How much do you like doing artistic things?",
            type: .ranged,
            answers: [
                Answer(text: "I don't like art", type: .Shinx),
                Answer(text: "I kind of enjoy looking at art", type: .Turtwig),
                Answer(text: "I think art is pretty cool", type: .Rockruff),
                Answer(text: "Art is the best", type: .Scorbunny)
            ]
        ),
        Question(
            text: "Which is you?",
            type: .multiple,
            answers: [
                Answer(text: "I am a patient person", type: .Turtwig),
                Answer(text: "I get scared easily", type: .Shinx),
                Answer(text: "I get bored really easy", type: .Scorbunny),
                Answer(text: "I love to be around people", type: .Rockruff)
            ]
        ),
        Question(
            text: "What is more like you?",
            type: .single,
            answers: [
                Answer(text: "I will relax and try to forget about work", type: .Turtwig),
                Answer(text: "I will get things done as fast as possible", type: .Shinx),
                Answer(text: "I like to take my time to get things done", type: .Scorbunny),
                Answer(text: "I can't relax until I finish everything", type: .Rockruff)
            ]
        )
   ]
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
            case singleButton1:
                answersChosen.append(currentAnswers[0])
            case singleButton2:
                answersChosen.append(currentAnswers[1])
            case singleButton3:
                answersChosen.append(currentAnswers[2])
            case singleButton4:
                answersChosen.append(currentAnswers[3])
            default:
                break
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
            let index = Int(round(rangedSlider.value *
              Float(currentAnswers.count - 1)))
        
            answersChosen.append(currentAnswers[index])
        
            nextQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) /
            Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch  currentQuestion.type {
            case .single:
                updateSingleStack(using: currentAnswers)
            case .multiple:
                updateMultipleStack(using: currentAnswers)
            case .ranged:
                updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }

    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false
            multiLabel1.text = answers[0].text
            multiLabel2.text = answers[1].text
            multiLabel3.text = answers[2].text
            multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
            rangedSlider.setValue(0.5, animated: false)
            rangedLabel1.text = answers.first?.text
            rangedLabel2.text = answers.last?.text
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) ->
       ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
    
    func nextQuestion() {
        questionIndex += 1
            if questionIndex < questions.count {
                updateUI()
            } else {
                performSegue(withIdentifier: "Results", sender: nil)
            }
    }
    
    
    
}
