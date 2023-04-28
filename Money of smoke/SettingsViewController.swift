//
//  SettingsViewController.swift
//  Money of smoke
//
//  Created by Alex on 26.04.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var costTextField: UITextField!
    @IBOutlet var quantityTextField: UITextField!
    
    @IBOutlet var firstDatePicker: UIDatePicker!
    @IBOutlet var lastDatePicker: UIDatePicker!
    
    var calculator: Calculator!
    unowned var delegate: SettingsViewControllerDelegate!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        costTextField.delegate = self
        quantityTextField.delegate = self
        
        costTextField.keyboardType = .decimalPad
        quantityTextField.keyboardType = .numberPad
        
        lastDatePicker.minimumDate = firstDatePicker.date
        
        if calculator.isValuesSet {
            costTextField.text = String(format: "%.2f", calculator.cigarettePackagePrice)
            quantityTextField.text = String(format: "%d", calculator.cigarettesPerDay)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonPressed() {
        guard let costString = costTextField.text, let cost = Double(costString), let quantityString = quantityTextField.text, let quantity = Int(quantityString) else {
            getAlert(withTitle: "Упс!", andMessage: "Пожалуйста, введите данные..")
            return
        }
        
        let firstDate = firstDatePicker.date
        let lastDate = lastDatePicker.date
        
        let updateCalculator = Calculator(cigarettePackagePrice: cost, cigarettesPerDay: quantity, firstDate: firstDate, lastDate: lastDate)
        
        delegate.didUpdateCalculator(updateCalculator)
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - PrivateMethods
    private func getAlert(
        withTitle title: String,
        andMessage message: String,
        textField: UITextField? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
        
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty, let value = Double(text), (1...9999).contains(value) else {
            getAlert(withTitle: "Ошибка", andMessage: "Попробуйте еще..", textField: textField)
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1
            return
        }
        
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
}
