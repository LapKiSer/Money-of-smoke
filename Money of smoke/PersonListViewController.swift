//
//  PersonListViewController.swift
//  Money of smoke
//
//  Created by Рома Баранов on 25.04.2023.
//

import UIKit

final class PersonListViewController: UITableViewController {
    // MARK: - Private Properties
    private let persons = Person.getPersons()
    
    // MARK: - View Life Sycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "bg-image"))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoPerson", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = persons[indexPath.row]
        
        content.text = person.fullName
        content.secondaryText = "Возраст: \(person.age)"
        content.image = UIImage(named: Photo.photo.rawValue)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        content.textProperties.color = .white
        content.secondaryTextProperties.color = .white
        content.textProperties.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        cell.contentConfiguration = content

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let infoVC = segue.destination as? InfoViewController else { return }
            infoVC.person = persons[indexPath.row]
        }
    }
}
