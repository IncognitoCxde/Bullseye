//
//  LeaderboardViewController.swift
//  Bullseye 1
//
//  Created by Ilmhona 10 on 20/09/24.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    // MARK: Variables
    
    let leaderboardLabel = UILabel()
    let closeButton = UIButton()
    let mainStackView = UIStackView()
    
    // MARK: Functions
    
    func setUpLeaderboardLabel() {
        let text = "L e a d e r b o a r d"
        leaderboardLabel.text = text.uppercased()
        leaderboardLabel.font = UIFont.systemFont(ofSize: 30, weight: .black)
        leaderboardLabel.textColor = UIColor(named: "Color 1")
        leaderboardLabel.textAlignment = .center
        leaderboardLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setUpCloseButton() {
        let close = UIImage(named: "close")
        closeButton.setImage(close, for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: Override func
    
    override func viewDidLoad() {
        
        // MARK: Load views and call functions
        
        super.viewDidLoad()
        view.addSubview(leaderboardLabel)
        view.addSubview(closeButton)
        setupMainStackView()
        setupLeaderboard()
        setUpLeaderboardLabel()
        setUpCloseButton()
        
        view.backgroundColor = UIColor(named: "Color 8")
        
        setUpConstraints()
        
        // MARK: Constraints
        
        func setUpConstraints() {
            
            leaderboardLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(45)
                make.centerX.equalToSuperview()
            }
            NSLayoutConstraint.activate([
                
                closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
                closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                closeButton.widthAnchor.constraint(equalToConstant: 60),
                closeButton.heightAnchor.constraint(equalToConstant: 60),
                
            ])
        }
        
        // MARK: Configure StackView
        
        func setupMainStackView() {
            
            mainStackView.axis = .vertical
            mainStackView.alignment = .fill
            mainStackView.distribution = .fillEqually
            mainStackView.spacing = 10
            mainStackView.translatesAutoresizingMaskIntoConstraints = false
            
            // Add the stack view to the main view
            view.addSubview(mainStackView)
            
            // Set constraints for the stack view
            
            mainStackView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().inset(20)
                make.top.equalToSuperview().offset(100)
                make.bottom.equalToSuperview().inset(50)
            }
            
        }
        
        // MARK: Configure Leaderboard
        
        func setupLeaderboard() {
            
            let headerRow = createRow(player: "PLAYER", score: "SCORE", rounds: "ROUNDS", isHeader: true)
            mainStackView.addArrangedSubview(headerRow)
            
            
            for _ in 1...3 {
                let playerRow = createRow(player: "DOG", score: "459", rounds: "4")
                mainStackView.addArrangedSubview(playerRow)
            }
        }
        
        // MARK: Create Rows
        
        
        func createRow(player: String, score: String, rounds: String, isHeader: Bool = false) -> UIView {
            // Create a horizontal stack view for each row
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.alignment = .fill
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 10
            
            // Create individual labels for Player, Score, and Rounds
            let playerLabel = createLabel(text: player, isHeader: isHeader)
            let scoreLabel = createLabel(text: score, isHeader: isHeader)
            let roundsLabel = createLabel(text: rounds, isHeader: isHeader)
            
            // Add labels to the row stack view
            rowStackView.addArrangedSubview(playerLabel)
            rowStackView.addArrangedSubview(scoreLabel)
            rowStackView.addArrangedSubview(roundsLabel)
            
            // Wrap the stack in a UIView to apply borders
            let rowView = UIView()
            rowView.addSubview(rowStackView)
            rowStackView.translatesAutoresizingMaskIntoConstraints = false
            
            // Add border around the row
            rowView.layer.borderWidth = 1.5
            rowView.layer.borderColor = UIColor(named: "Color")?.cgColor
            rowView.layer.cornerRadius = 28
            rowView.backgroundColor = isHeader ?  UIColor.white : UIColor(named: "Color 0")
            
            // Constraints for rowStackView within rowView
            
            rowStackView.snp.makeConstraints { make in
                make.leading.equalTo(rowView.snp.leading).offset(10)
                make.trailing.equalTo(rowView.snp.trailing).inset(10)
                make.top.equalTo(rowView.snp.top).offset(10)
                make.bottom.equalTo(rowView.snp.bottom).inset(10)
            }
            
            return rowView
        }
    }
    
    // MARK: - Create Label
    func createLabel(text: String, isHeader: Bool) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = isHeader ? UIFont.boldSystemFont(ofSize: 18) : UIFont.systemFont(ofSize: 19, weight: .bold)
        label.textColor = isHeader ? .black: UIColor(named: "Color 1")
        return label
    }
    
    // MARK: @objc func for Close Button
    @objc func closeButtonTapped() {
        // Dismiss the current view controller
        self.dismiss(animated: true, completion: nil)
        
    }
}
