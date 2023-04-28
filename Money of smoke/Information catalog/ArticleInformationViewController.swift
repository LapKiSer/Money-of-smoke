//
//  ArticleInformationViewController.swift
//  Money of smoke
//
//  Created by Admin on 27/04/2023.
//

import UIKit

final class ArticleInformationViewController: UIViewController {

    
    @IBOutlet weak var articleTextView: UITextView!
    
    var articles: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = articles.articleName
        articleTextView.text = articles.articleHistory

    }
}
