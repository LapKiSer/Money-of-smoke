//
//  CompanyListViewController.swift
//  Money of smoke
//
//  Created by Admin on 26/04/2023.
//

import UIKit

final class CompanyListViewController: UITableViewController {

    private var companyList = Company.getCompanyList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoOverlay()
    }
    
    private func photoOverlay() {
        let backgroundImage = UIImageView(image: UIImage(named: "bg-image"))
        backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
    }
}

extension CompanyListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        companyList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyName", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let company = companyList[indexPath.row]
        
        content.text = company.companyName
        content.textProperties.color = .white
        content.textProperties.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailVC = segue.destination as? CompanyInformationViewController else { return }
            detailVC.company = companyList[indexPath.row]
        }
    }
}
