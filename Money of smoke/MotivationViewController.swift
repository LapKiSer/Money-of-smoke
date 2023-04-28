//
//  MotivationViewController.swift
//  Money of smoke
//
//  Created by Stacy on 26/04/2023.
//

import UIKit

final class Motivation: UIViewController {
    
    @IBOutlet weak var motivationLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    let quotes = Quotes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshMotivationTapped()
    }
    
    @IBAction func refreshMotivationTapped() {
        motivationLabel.text = Quotes().getQuoteText()
    }
}
