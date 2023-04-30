//
//  MotivationViewController.swift
//  Money of smoke
//
//  Created by Stacy on 26/04/2023.
//

import UIKit

final class Motivation: UIViewController {
    
    @IBOutlet  var motivationLabel: UILabel!
    
    let quotes = Quotes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshMotivationTapped()
    }
    
    @IBAction func refreshMotivationTapped() {
        motivationLabel.text = Quotes().getQuoteText()
    }
}
