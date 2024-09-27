//
//  ViewController.swift
//  Bullseye 1
//
//  Created by Ilmhona 10 on 20/09/24.
//

// MARK: imports

import SnapKit

import UIKit



class ViewController: UIViewController {
    
    // MARK: Variables
    
    let manager = BullseyeGameManager()
    let titleLabel = UILabel()
    let targetNumber = UILabel()
    let targetSlider = UISlider()
    let oneLimit = UILabel()
    let hundredLimit = UILabel()
    let hitMeButton = UIButton()
    let leaderboardButton = UIButton()
    let backgroundImage = UIImageView()
    let scoreLabel = UILabel()
    let roundLabel = UILabel()
    let roundNum = UILabel()
    let scoreNum = UILabel()
    
    // MARK: Functions
    
    func setUpTitleLabel() {
        let text = "Put The Bullseye as Close as you can to"
        titleLabel.text = text.uppercased()
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .black)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setUpTargetNumber() {
        let score = "\(manager.targetNumber)"
        targetNumber.text = score.uppercased()
        targetNumber.font = UIFont.systemFont(ofSize: 38, weight: .black)
        targetNumber.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpTargetSlider() {
        targetSlider.value = 0.5
        targetSlider.minimumValue = 1
        targetSlider.maximumValue = 100
        targetSlider.minimumTrackTintColor = .red
        targetSlider.maximumTrackTintColor = .systemGray3
        if let thumbImage = UIImage(named: "Nub") {
               targetSlider.setThumbImage(thumbImage, for: .normal)
           } else {
               print("Error: Could not find image named 'Nub'")
           }
        targetSlider.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpOneLimit() {
        let onelimit = "1"
        oneLimit.text = onelimit.uppercased()
        oneLimit.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        oneLimit.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpHundredLimit() {
        let hundredlimit = "100"
        hundredLimit.text = hundredlimit.uppercased()
        hundredLimit.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        hundredLimit.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpHitMeButton() {
        hitMeButton.setTitle("Hit Me!", for: .normal)
        hitMeButton.setTitleColor(.white, for: .normal)
        hitMeButton.backgroundColor = UIColor(named: "Color")
        hitMeButton.layer.cornerRadius = 20
        hitMeButton.addTarget(self, action: #selector(handleHitMeButton), for: .touchUpInside)
        hitMeButton.translatesAutoresizingMaskIntoConstraints = false
        hitMeButton.layer.borderWidth = 2
        hitMeButton.layer.borderColor = UIColor(ciColor: .white).cgColor
        hitMeButton.layer.cornerRadius = 20
    }
    
    func setUpLeaderboardButton() {
        leaderboardButton.setImage(UIImage(named: "Leaderboard"), for: .normal)
        leaderboardButton.translatesAutoresizingMaskIntoConstraints = false
        leaderboardButton.addTarget(self, action: #selector(showLBVC), for: .touchUpInside)
    }
    
    func setUpBackgroundImage() {
        backgroundImage.image = UIImage(named: "Pattern")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpscoreLabel() {
        scoreLabel.text = "score"
        scoreLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpRoundLabel() {
        roundLabel.text = "round"
        roundLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpscoreNum() {
        scoreNum.text = "\(manager.score)"
        scoreNum.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        scoreNum.textAlignment = .center
        scoreNum.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUproundNum() {
        roundNum.text = "\(manager.round)"
        roundNum.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        roundNum.textAlignment = .center
        roundNum.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Load Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(titleLabel)
        view.addSubview(targetNumber)
        view.addSubview(targetSlider)
        view.addSubview(oneLimit)
        view.addSubview(hundredLimit)
        view.addSubview(hitMeButton)
        view.addSubview(leaderboardButton)
        view.addSubview(backgroundImage)
        view.addSubview(scoreLabel)
        view.addSubview(roundLabel)
        view.addSubview(roundNum)
        view.addSubview(scoreNum)
        
        setUpRoundLabel()
        setUpscoreLabel()
        setUproundNum()
        setUpscoreNum()
        setUpLeaderboardButton()
        setUpHitMeButton()
        setUpTitleLabel()
        setUpTargetNumber()
        setUpTargetSlider()
        setUpOneLimit()
        setUpHundredLimit()
        setUpBackgroundImage()

        setUpKitConstraints()
        
        targetSlider.value = (targetSlider.minimumValue + targetSlider.maximumValue) / 2.1
        
        // MARK: Constraints
        
        func setUpKitConstraints() {
            
            // MARK: Title
            
                titleLabel.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(40)
                    make.centerX.equalToSuperview()
                
            // MARK: Target Number
            
                targetNumber.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(80)
                    make.centerX.equalToSuperview()
                }
            // MARK: Target Slider
                    
                    targetSlider.snp.makeConstraints { make in
                        make.centerY.equalTo(oneLimit.snp.centerY)
                        make.leading.equalTo(oneLimit.snp.leading).offset(20)
                        make.trailing.equalTo(hundredLimit.snp.trailing).inset(45)
                    }
                    
                    
            // MARK: Limit Numbers
                    
                    oneLimit.snp.makeConstraints { make in
                        make.left.equalToSuperview().inset(100)
                        make.bottom.equalToSuperview().inset(160)
                    }
                    
                    hundredLimit.snp.makeConstraints { make in
                        make.right.equalToSuperview().inset(50)
                        make.bottom.equalToSuperview().inset(160)
                    }
                    
            // MARK: Score & Rounds
                    
                    scoreLabel.snp.makeConstraints { make in
                        make.left.equalTo(oneLimit.snp.left)
                        make.bottom.equalTo(oneLimit.snp.bottom).offset(80)
                    }
                    
                    roundLabel.snp.makeConstraints { make in
                        make.right.equalTo(hundredLimit.snp.right)
                        make.bottom.equalTo(hundredLimit.snp.bottom).offset(80)
                    }
                    
                    scoreNum.snp.makeConstraints { make in
                        make.left.equalTo(scoreLabel.snp.left).offset(15)
                        make.bottom.equalTo(scoreLabel.snp.bottom).offset(30)
                    }
                    
                    roundNum.snp.makeConstraints { make in
                        make.right.equalTo(roundLabel.snp.right).inset(15)
                        make.bottom.equalTo(roundLabel.snp.bottom).offset(30)
                    }
                    
            // MARK: Hit Me Button
                    
                    hitMeButton.snp.makeConstraints { make in
                        make.centerX.equalToSuperview()
                        make.bottom.equalTo(scoreNum.snp.bottom)
                        make.width.equalTo(120)
                        make.height.equalTo(60)
                    }
            
            // MARK: Leaderboard Button
                    
                    leaderboardButton.snp.makeConstraints { make in
                        make.top.equalTo(titleLabel.snp.top)
                        make.trailing.equalTo(titleLabel.snp.trailing).offset(100)
                    }
            
            // MARK: Background Pattern
                    
                    backgroundImage.snp.makeConstraints { make in
                        make.leading.equalToSuperview()
                        make.trailing.equalToSuperview()
                        make.top.equalToSuperview()
                        make.bottom.equalToSuperview()
                    }
                    
                    
            }
        }
    }
    
    // MARK: Excessive Functions
    
    @objc func showLBVC() {
        print("working")
       let lvc = LeaderboardViewController()
        let nc = UINavigationController(rootViewController: lvc)

       present(nc, animated: true)
    }
    
    @objc func handleHitMeButton() {
        let sliderValue = Int(targetSlider.value)
        print(sliderValue)
        
        if sliderValue == manager.targetNumber {
            showAlertSuccess()
                
        } else {
            showAlertFailure()
        }
    }
    
    func updateLabels() {
        targetNumber.text = String(manager.targetNumber)
        scoreNum.text = String(manager.score)
        roundNum.text = String(manager.round)
    }
    
    func showAlertSuccess() {
            let myAlert = UIAlertController(title: "You guessed the number", message: "Congratulations", preferredStyle: .alert)
            let handler: ((UIAlertAction)->Void)? = { action in
                self.manager.didWinTheGame()
                self.updateLabels()
            }
            let action = UIAlertAction(title: "Start", style: .default, handler: handler)
            myAlert.addAction(action)
            show(myAlert, sender: self)
        }
        
        func showAlertFailure() {
            let myAlert = UIAlertController(title: "You didn't guess the number", message: "Please, try again", preferredStyle: .alert)
            
            let handler: ((UIAlertAction)->Void)? = { action in
                self.manager.didLoseTheGame()
                self.updateLabels()
            }
            let action = UIAlertAction(title: "Start", style: .default, handler: handler)
            myAlert.addAction(action)
            show(myAlert, sender: self)
        }
}

