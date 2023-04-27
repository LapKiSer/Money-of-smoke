//
//  Person.swift
//  Money of smoke
//
//  Created by Рома Баранов on 25.04.2023.
//

struct Person {
    var name: String
    var surname: String
    var age: String
    var id: String
    var biographie: String
    var photo: String
    
    var fullName: String {
        "\(surname) \(name)"
    }
    
    
    static func getPersons() -> [Person] {
        var result: [Person] = []
        
        let count = min(
            CreatorsDataStorage.shared.names.count,
            CreatorsDataStorage.shared.surnames.count,
            CreatorsDataStorage.shared.age.count,
            CreatorsDataStorage.shared.developerID.count,
            CreatorsDataStorage.shared.photo.count
        )
        
        for number in 0..<count {
            let name = CreatorsDataStorage.shared.names[number]
            let surname = CreatorsDataStorage.shared.surnames[number]
            let age = CreatorsDataStorage.shared.age[number]
            let id = CreatorsDataStorage.shared.developerID[number]
            let biographie = CreatorsDataStorage.shared.biographies[number]
            let photo = CreatorsDataStorage.shared.photo[number]
            
            result.append(Person(
                name: name,
                surname: surname,
                age: age,
                id: id,
                biographie: biographie,
                photo: photo
            ))
        }
        
        return result
    }
}


enum Photo: String {
    case photo = "fi-br-following"
}
