//
//  ViewController.swift
//  rockPaperScissors
//
//  Created by Jacob Smith on 1/15/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet weak var topLeftHand: UIImageView!
    @IBOutlet weak var topRightHand: UIImageView!
    var random: Int = 0
    var random2: Int = 0
    @IBOutlet var EnemyPlayerHand: [UIImageView]!
    @IBOutlet weak var yourHand: UIImageView!
    @IBOutlet weak var rockSelection: UIImageView!
    @IBOutlet weak var paperSelection: UIImageView!
    @IBOutlet weak var scissorSelection: UIImageView!
    @IBOutlet var choiceOfHands: [UIImageView]!
    @IBOutlet weak var victoryLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    var timerIsOn: Bool = true
    var timer = Timer()
    var globalWin: Bool = false
    var count: Int = 3
    var allowPlay: Bool = false
    var detectedPlay: Bool = false
    var usedPlayButton: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    func determineWinner() {
        var win: Bool = false
        var tie: Bool = false
        for hand in EnemyPlayerHand {
            if hand.image == UIImage(named: "rock") {
                if yourHand.image == UIImage(named: "rock") {
                    win = false
                    tie = true
                }
                if yourHand.image == UIImage(named: "paper") {
                    win = true
                }
                if yourHand.image == UIImage(named: "scissors") {
                    win = false
                }
            }
            if hand.image == UIImage(named: "paper") {
                if yourHand.image == UIImage(named: "rock") {
                    win = false
                }
                if yourHand.image == UIImage(named: "paper") {
                    win = false
                    tie = true
                }
                if yourHand.image == UIImage(named: "scissors") {
                    win = true
                }
            }
            if hand.image == UIImage(named: "paper") {
                if yourHand.image == UIImage(named: "rock") {
                    win = false
                }
                if yourHand.image == UIImage(named: "paper") {
                    win = false
                    tie = true
                }
                if yourHand.image == UIImage(named: "scissors") {
                    win = true
                }
            }
        }
        if win == true {
            victoryLabel.text = "You Win"
            startButton.isEnabled = true
            setVarsToInit()
        }
        if tie == true {
            victoryLabel.text = "You Tie"
            startButton.isEnabled = true
            setVarsToInit()
        } else {
            victoryLabel.text = "You Lose"
            startButton.isEnabled = true
            setVarsToInit()
        }
    }

    @IBAction func whenPlayPressed(_ sender: UIButton) {
        if allowPlay {
            count = 0
            random = Int.random(in: 0...2)
            random2 = Int.random(in: 0...2)
            detectedPlay = true
            giveEnemyHandChoice()
            determineWinner()
            setVarsToInit()
            allowPlay = false
            usedPlayButton = true
        }
        
        
    }
    
    @IBAction func whenTappedOnScreen(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: view)

        //let selectedPointOnBlankView = sender.location(in: blankView)
        
        print(tapGesture)
        for hand in choiceOfHands {
            if hand.frame.contains(selectedPoint) {
                print(allowPlay)
                if allowPlay {
                    yourHand.image = hand.image
                }
                if !allowPlay {
                    self.victoryLabel.text = "You cannot select until you press 'Start'"
                }
            }
        }
    }
    
    @IBAction func whenStartButtonPressed(_ sender: UIButton) {
        topLeftHand.image = UIImage(named: "")
        topRightHand.image = UIImage(named: "")
        timerIsOn = true
        count = 3
        timerLabel.text = "\(count)"
        victoryLabel.text = "-"
        allowPlay = true
        if timerIsOn {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                if self.count > 0 {
                    self.count -= 1
                    self.timerLabel.text = "\(self.count)"
                    print(self.count)
                }
                
                if self.count == 0 {
                    if !self.detectedPlay {
                        
                        self.victoryLabel.text = "You Lose"
                        self.setVarsToInit()
                    }
                    print(self.count)
                    
                    self.timerIsOn = false
                    self.timerLabel.text = "\(self.count)"
                    self.setEnemySetWinner()
                    self.timer.invalidate()
                }
                
                
            })
            
            
        }
    }
    
    
    func giveEnemyHandChoice() {
        
        var hand: UIImage!
        switch random {
        case 0:
            topLeftHand.image = UIImage(named: "rock")
            hand = topLeftHand.image
        case 1:
            topLeftHand.image = UIImage(named: "scissors")
            hand = topLeftHand.image
        case 2:
            topLeftHand.image = UIImage(named: "paper")
            hand = topLeftHand.image
        default:
            return
        }
        
        var hand2: UIImage!
        switch random2 {
        case 0:
            topRightHand.image = UIImage(named: "rock")
            hand2 = topRightHand.image
        case 1:
            topRightHand.image = UIImage(named: "scissors")
            hand2 = topRightHand.image
        case 2:
            topRightHand.image = UIImage(named: "paper")
            hand2 = topRightHand.image
        default:
            return
        }
    }
    
    func setEnemySetWinner() {
        if !usedPlayButton {
            random = Int.random(in: 0...2)
            random2 = Int.random(in: 0...2)
            detectedPlay = true
            giveEnemyHandChoice()
            determineWinner()
            setVarsToInit()
        }
        
    }
    
    func setVarsToInit() {
        usedPlayButton = false
        allowPlay = false
    }
    
    @IBAction func whenHowToPlayPressed(_ sender: UIBarButtonItem) {
        if let url = URL(string: "http://www.rinkworks.com/games/rps.shtml") {
            print("if let done")
            let safariViewController = SFSafariViewController(url:
                url)
            present(safariViewController, animated: true,
                    completion: nil)
        }
    }
}

