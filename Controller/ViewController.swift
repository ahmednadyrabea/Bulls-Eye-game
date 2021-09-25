//
//  ViewController.swift
//  BullsEye
//
//  Created by Ahmed Nady Rabea on 25/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderOutLet: UISlider!
    @IBOutlet weak var targetLBL: UILabel!
    @IBOutlet weak var scoreLBL: UILabel!
    @IBOutlet weak var roundLBL: UILabel!
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    var differenceValue: Int = 0
    var points: Int = 0
    var score: Int = 0
    var round: Int = 0
    var alertTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = sliderOutLet.value.rounded()
        currentValue = Int(roundedValue)
        
        startNewRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        sliderOutLet.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        sliderOutLet.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        sliderOutLet.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        sliderOutLet.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    
    //MARK: IBAction
    
    @IBAction func SliderMoved(_ sender: UISlider) {
        
        let roundedValue = sender.value.rounded()
        currentValue = Int(roundedValue)
        
    }
    
    @IBAction func showAlertBtnPressd(_ sender: UIButton) {
        
        calculateDifference()
        
        let alert = UIAlertController(title: alertTitle, message: "The value of the slider is now: \(self.currentValue)" +
            "\nThe target value is: \(self.targetValue)" +
            "\nDifference value is: \(self.differenceValue)" +
            "\nYour Score is: \(self.score)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel) { (_) in
            self.startNewRound()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func startOverBtnPressed(_ sender: UIButton) {
        
        score = 0
        round = 0
        
        startNewRound()
    }
    
    
    //MARK: Helper Functions
    
    func startNewRound(){
        
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        sliderOutLet.value = Float(currentValue)
        
        updateLabels()
    }

    func calculateDifference(){
        
        differenceValue = currentValue > targetValue ? currentValue - targetValue : targetValue-currentValue
        
        calculatePoints()
    }
    
    func calculatePoints(){
        
        points = 100 - differenceValue
        setTitleAndGift()
        updateLabels()
    }
    
    func updateLabels(){
        
        targetLBL.text = "\(targetValue)"
        scoreLBL.text = "\(score)"
        roundLBL.text = "\(round)"
    }
    
    func setTitleAndGift(){
        
        if differenceValue == 0{
            points += 100
            alertTitle = "Perfect!"
        }else if differenceValue < 5{
            points += 50
            alertTitle = "Your almost had it!"
        }else if differenceValue < 10{
            points += 10
            alertTitle = "Pretty Good"
        }else{
            alertTitle = "Not even close"
        }
        
        score += points

    }
}

