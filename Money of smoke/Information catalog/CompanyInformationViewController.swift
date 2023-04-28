//
//  CompanyInformationViewController.swift
//  Money of smoke
//
//  Created by Admin on 26/04/2023.
//

import UIKit

final class CompanyInformationViewController: UIViewController {
   
    @IBOutlet weak var companyTextView: UITextView!
    
    var company: Company!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = company.companyName
        
        companyTextView.text = company.companyHistory
    }
}
