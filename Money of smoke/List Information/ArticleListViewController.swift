//
//  ArticleListViewController.swift
//  Money of smoke
//
//  Created by Admin on 27/04/2023.
//

import UIKit

final class ArticleListViewController: UITableViewController {

    private var article = Article.getArticleList()
    
    @IBAction func backButtonTap(_ sender: Any) {
        dismiss(animated: true)
    }
}
extension ArticleListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        article.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleName", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let company = article[indexPath.row]
        
        content.text = company.articleName
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailVC = segue.destination as? ArticleInformationViewController  else { return }
            detailVC.articles = article[indexPath.row]
        }
    }
}

