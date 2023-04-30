//
//  Protocols.swift
//  Money of smoke
//
//  Created by Кирилл Лапковский on 30.04.2023.
//

import UIKit

protocol ChildViewControllerDelegate: AnyObject {
    func childViewController(_ viewController: UIViewController, didUpdateNavigationTitle title: String)
}

