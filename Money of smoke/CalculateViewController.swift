//
//  CalculateViewController.swift
//  Money of smoke
//
//  Created by Alex on 26.04.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func didUpdateCalculator(_ calculator: Calculator)
}

final class CalculateViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var moneyLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var lifeLabel: UILabel!
    
    @IBOutlet var startButton: UIButton!
    
    private var calculator = Calculator.getValues()
    
    // MARK: - ViewlifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.tintColor = .systemMint
        updateLabels()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsVC = segue.destination as? SettingsViewController {
            settingsVC.delegate = self
        }
    }
    
    // MARK: - PrivateMethods
    private func updateLabels() {
        moneyLabel.text = String(format: "%.1f руб.", calculator.moneySaved)
        timeLabel.text = String(format: "%d дн.", calculator.daysWithoutSmoking)
        lifeLabel.text = String(format: "%.1f дн.", calculator.lifeSavedDays)
    }

}

// MARK: - SettingsViewControllerDelegate
extension CalculateViewController: SettingsViewControllerDelegate {
    func didUpdateCalculator(_ calculator: Calculator) {
        self.calculator = calculator
        updateLabels()
    }
}
