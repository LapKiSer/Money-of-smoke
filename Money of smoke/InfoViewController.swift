//
//  InfoViewController.swift
//  Money of smoke
//
//  Created by Рома Баранов on 25.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet var photoImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    
    @IBOutlet var biographyTaxtView: UITextView!
    
    var person: Person!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = person.name
        nameLabel.text = "Имя: \(person.name)"
        surnameLabel.text = "Фамилия: \(person.surname)"
        ageLabel.text = "Возраст: \(person.age)"
        idLabel.text = "Телеграм: \(person.id)"
        biographyTaxtView.text = person.biographie
        photoImage.image = UIImage(named: person.photo)
        
    }
    override func viewDidLayoutSubviews() {
        photoImage.layer.cornerRadius = photoImage.frame.width / 2
        photoOverlay()
    }
    
    private func photoOverlay() {
        let backgroundImage = UIImageView(image: UIImage(named: "bg-image"))
        backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
}
